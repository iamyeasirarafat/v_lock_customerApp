import 'package:flutter/material.dart';
import 'package:v_lock/screens/login_screen.dart';
import 'package:v_lock/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'V Lock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}