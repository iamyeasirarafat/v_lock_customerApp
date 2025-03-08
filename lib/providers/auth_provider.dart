// lib/providers/auth_provider.dart
import 'package:flutter/foundation.dart';
import 'package:vehicle_Lock/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  bool _isLoading = false;
  String? _error;
  bool _isLoggedIn = false;

  AuthProvider(this._authService);

  // Getters
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> initialize() async {
    _isLoggedIn = await _authService.isLoggedIn();
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.login(email, password);
      _isLoggedIn = true;
      _error = null;
    } catch (e) {
      _error = 'Login failed: ${e.toString()}';
      _isLoggedIn = false;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.register(name, email, password);
      _error = null;
    } catch (e) {
      _error = 'Registration failed: ${e.toString()}';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    _isLoggedIn = false;
    notifyListeners();
  }
}
