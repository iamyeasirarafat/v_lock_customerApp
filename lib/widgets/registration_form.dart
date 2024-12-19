// Registration form widget
import 'package:flutter/material.dart';

Widget registrationForm({
  required GlobalKey<FormState> key,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required Color primaryColor
}) {
  return Form(
    key: key,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name Input (additional field)
        Text(
          "Full Name",
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
          controller: nameController,
          decoration: InputDecoration(
            // labelText: 'Email/Phone Number',
            hintText: 'Enter your Name',
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
              return 'Please enter your Name';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
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
            }
            return null;
          },
        ),
      ],
    ),
  );
}
