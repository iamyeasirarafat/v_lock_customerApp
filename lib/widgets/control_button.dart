import 'package:flutter/material.dart';

Widget BuildControlButton(IconData icon, String label) {
  return Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.blue[50],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF212325), size: 28),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF212325)),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}