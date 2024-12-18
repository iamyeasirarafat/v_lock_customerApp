import 'package:flutter/material.dart';

// import '../services/api_service.dart';
// import '../utils/auth_token.dart';
// import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // void _login() async {
  //   final response = await ApiService.postRequest('/login', {
  //     'email': _emailController.text,
  //     'password': _passwordController.text,
  //   });

  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     await AuthToken.saveToken(data['token']);
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed')));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _emailController,
                decoration:const  InputDecoration(labelText: 'Email')),
            TextField(
                controller: _passwordController,
                decoration:const InputDecoration(labelText: 'Password'),
                obscureText: true),
            const SizedBox(height: 20),
            // ElevatedButton(onPressed: _login, child: Text('Login')),
            ElevatedButton(onPressed: () {}, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
