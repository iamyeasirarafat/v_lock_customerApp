// lib/services/auth_service.dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vehicle_Lock/config/config.dart';

class AuthService {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthService() {
    _dio.options.baseUrl = AppConfig.baseUrl;
    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await _storage.read(key: 'access_token');
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          try {
            final newToken = await _refreshToken();
            error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
            return handler.resolve(await _dio.fetch(error.requestOptions));
          } catch (e) {
            handler.reject(error);
          }
        }
        return handler.next(error);
      },
    ));
  }

  Future<String> _refreshToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    final response = await _dio.post(
      '/user/token/refresh/',
      data: {'refresh_token': refreshToken},
    );
    await _persistTokens(response.data);
    return response.data['access_token'];
  }

  Future<void> login(String email, String password) async {
    final response = await _dio.post(
      "/user/login/?app=true",
      data: {'email': email, 'password': password},
    );
    await _persistTokens(response.data);
  }

  Future<void> register(String name, String email, String password) async {
    final response = await _dio.post(
      '/user/register/',
      data: {'full_name': name, 'email': email, 'password': password},
    );
    await _persistTokens(response.data);
  }

  Future<void> _persistTokens(Map<String, dynamic> tokens) async {
    await _storage.write(
      key: 'access_token',
      value: tokens['access_token'],
    );
    await _storage.write(
      key: 'refresh_token',
      value: tokens['refresh_token'],
    );
  }

  Future<void> logout() async {
    await _storage.deleteAll();
    _dio.interceptors.clear();
  }

  Future<bool> isLoggedIn() async {
    return await _storage.containsKey(key: 'access_token');
  }
}
