// Login form widget
import 'package:flutter/material.dart';

Widget loginForm(
    {required GlobalKey<FormState> key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required bool rememberMe,
    required Function(bool) onRememberMeChanged}) {
  return Form(
    key: key,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email Input
        Text(
          "Email/Phone Number",
          textAlign: TextAlign.left, // Aligns the text to the left
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            // labelText: 'Email/Phone Number',
            hintText: 'Enter your email',
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (value != "user@gmail.com") {
              return 'invalid email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        // Password Input
        Text(
          "Password",
          textAlign: TextAlign.left, // Aligns the text to the left
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            // labelText: 'Password',
            hintText: "******",
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value != "123456") {
              return 'invalid password';
            }
            return null;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                Checkbox(
                    value: rememberMe,
                    onChanged: (bool? value) {
                      onRememberMeChanged(value ?? false);
                    }),
                Text('Remember for 30 days',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700]
                  ),),
              ],
            ),
            TextButton(
              onPressed: () {
                // Add logic for the "Forgot Password" action
                // For example, navigating to a password reset screen
              },
              child: const Text(
                'Forgot password',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
