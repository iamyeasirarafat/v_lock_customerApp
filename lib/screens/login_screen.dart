import 'package:flutter/material.dart';
import 'package:v_lock/screens/home_screen.dart';
import 'package:v_lock/widgets/login_form.dart';
import 'package:v_lock/widgets/registration_form.dart';

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
          MaterialPageRoute(
              builder: (context) => const HomeScreen()),
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
            padding: const EdgeInsets.only(top: 48, left: 20, right: 20),
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
                      fillColor: Colors.white,
                      selectedColor: Colors.grey[700],
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      color: Colors.grey[500],
                      selectedBorderColor: Colors.transparent,
                      // No border for selected buttons
                      constraints:
                          const BoxConstraints(minWidth: 156, minHeight: 36),
                      // children: [
                      //   Text('Sign up'),
                      //   Text('Log in'),
                      // ],
                      children: [
                        Container(
                          width: 156,
                          decoration: BoxDecoration(
                            boxShadow: _isLoginSelected == true
                                ? []
                                : [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      // Soft black shadow with low opacity
                                      blurRadius: 20,
                                      // Large blur for a fading effect
                                      spreadRadius: 0,
                                      // No spread radius
                                      offset: Offset(0,
                                          4), // Vertical offset for the shadow
                                    ),
                                  ],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(child: Text('Sign up')),
                        ),
                        Container(
                          width: 156,
                          decoration: BoxDecoration(
                            boxShadow: _isLoginSelected == true
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      // Soft black shadow with low opacity
                                      blurRadius: 20,
                                      // Large blur for a fading effect
                                      spreadRadius: 0,
                                      // No spread radius
                                      offset: Offset(0,
                                          4), // Vertical offset for the shadow
                                    ),
                                  ]
                                : [],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(child: Text('Log in')),
                        ),
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
                      onRememberMeChanged: _updateRememberMe)
                else
                  registrationForm(
                      key: _registrationFormKey,
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController),
                const SizedBox(height: 20),
                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity, 50),
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
                const SizedBox(height: 20),
                // Sign Up Link
                if (_isLoginSelected)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account? "),
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
