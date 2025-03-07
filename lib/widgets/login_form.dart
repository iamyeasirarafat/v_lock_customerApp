import 'package:flutter/material.dart';

Widget loginForm({
  required GlobalKey<FormState> key,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required bool rememberMe,
  required Function(bool) onRememberMeChanged,
  required Color primaryColor,
  required bool isPasswordVisible,
  required VoidCallback togglePasswordVisibility,
}) {
  return Form(
    key: key,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email Input
        Text(
          "Email/Phone Number",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Enter your email',
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),

        // Password Input
        Text(
          "Password",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: passwordController,
          obscureText: !isPasswordVisible,
          obscuringCharacter: '●',
          decoration: InputDecoration(
            hintText: "******",
            hintStyle: TextStyle(color: Colors.grey[500]),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: togglePasswordVisibility,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),

        // Remember Me & Forgot Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 16,
                  width: 16,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                    value: rememberMe,
                    onChanged: (bool? value) {
                      onRememberMeChanged(value ?? false);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: GestureDetector(
                    onTap: () => onRememberMeChanged(!rememberMe),
                    child: Text(
                      'Remember for 30 days',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
