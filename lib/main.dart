import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_Lock/layouts/base_layout.dart';
import 'package:vehicle_Lock/providers/auth_provider.dart';
import 'package:vehicle_Lock/screens/permission_denied_screen.dart';
import 'package:vehicle_Lock/screens/splash_screen.dart';
import 'package:vehicle_Lock/services/auth_service.dart';
import 'package:vehicle_Lock/services/permission_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final permissionService = PermissionService();
  final permissionsGranted =
      await permissionService.checkAndRequestPermissions();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AuthService()),
        ChangeNotifierProxyProvider<AuthService, AuthProvider>(
          create: (context) => AuthProvider(context.read<AuthService>()),
          update: (context, authService, authProvider) =>
              authProvider!..initialize(),
        ),
      ],
      child: MyApp(permissionsGranted: permissionsGranted),
    ),
  );
}

class MyApp extends StatelessWidget {
  bool permissionsGranted;

  MyApp({super.key, required this.permissionsGranted});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V Lock',
      theme: ThemeData(
        primaryColor: const Color(0xFF6941C6),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return authProvider.isLoggedIn
              ? permissionsGranted
                  ? const BaseLayout()
                  : const PermissionDeniedScreen()
              : permissionsGranted
                  ? const SplashScreen()
                  : const PermissionDeniedScreen();
        },
      ),
    );
  }
}
