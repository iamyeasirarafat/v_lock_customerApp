import 'package:flutter/material.dart';
import 'package:vehicle_Lock/layouts/base_layout.dart';
import 'package:vehicle_Lock/widgets/login_form.dart';
import 'package:vehicle_Lock/widgets/registration_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _isLoginSelected = true;
  final _loginFormKey = GlobalKey<FormState>();
  final _registrationFormKey = GlobalKey<FormState>();

  void _updateRememberMe(bool value) {
    setState(() {
      _rememberMe = value;
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // Function to handle login or registration
  void _submitForm() {
    if (_isLoginSelected) {
      if (_loginFormKey.currentState!.validate()) {
        // Perform login logic
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BaseLayout()),
        );
      }
    } else {
      if (_registrationFormKey.currentState!.validate()) {
        // Perform registration logic
        print(
            'Name: ${nameController.text}, Email: ${emailController.text}, Password: ${passwordController.text}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Padding(
            padding: const EdgeInsets.only(top: 48, left: 0, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/logo.png', // Replace with your logo path
                ),
                const SizedBox(height: 24),
                // Title
                const Text(
                  'Log in to your account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Welcome back! Please enter your details.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),
                // Login/Sign-up Toggle Buttons
                Container(
                    width: double.infinity,
                    height: 44,
                    padding: const EdgeInsets.all(4),
                    // Adds padding inside the container
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[200]!), // Border color and width
                      borderRadius: BorderRadius.circular(
                          10), // Border radius for rounded corners
                    ),
                    child: Center(
                        child: ToggleButtons(
                      isSelected: [_isLoginSelected == false, _isLoginSelected],
                      onPressed: (int index) {
                        setState(() {
                          _isLoginSelected = index == 1;
                        });
                      },
                      borderColor: Colors.transparent,
                      fillColor: Colors.grey[200],
                      selectedColor: Colors.grey[700],
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      color: Colors.grey[500],
                      selectedBorderColor: Colors.transparent,

                      borderRadius: BorderRadius.circular(8),
                      // No border for selected buttons
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.434,
                          minHeight: 36),

                      children: const [
                        Text('Sign up'),
                        Text('Log in'),
                      ],
                    ))),
                const SizedBox(height: 30),
                // Conditional Form Rendering
                if (_isLoginSelected)
                  loginForm(
                      key: _loginFormKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      rememberMe: _rememberMe,
                      onRememberMeChanged: _updateRememberMe,
                      primaryColor:Theme.of(context).primaryColor
                      )
                else
                  registrationForm(
                      key: _registrationFormKey,
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      primaryColor:Theme.of(context).primaryColor
                      ),
                const SizedBox(height: 24),
                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _submitForm,
                  child: Text(
                    _isLoginSelected ? 'Sign in' : 'Register',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey[300]!)
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/google.png', 
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 12),
                       Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Sign Up Link
                if (_isLoginSelected)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLoginSelected =
                                false; // Switch to registration form
                          });
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!_isLoginSelected)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLoginSelected = true; // Switch to login form
                          });
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
