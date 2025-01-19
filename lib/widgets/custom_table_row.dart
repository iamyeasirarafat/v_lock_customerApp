import 'package:flutter/material.dart';

class CustomTableRow extends StatelessWidget {
  final String license;
  final String carName;
  final String expiryDate;
  final String expiresIn;

  const CustomTableRow(
      {super.key,
      required this.license,
      required this.carName,
      required this.expiresIn,
      required this.expiryDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            license,
            style: const TextStyle(
                color: Color(0xFF475467),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          Text(
            carName,
            style: const TextStyle(
                color: Color(0xFF475467),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          Text(
            expiryDate,
            style: const TextStyle(
                color: Color(0xFF475467),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          Text(
            expiresIn,
            style: const TextStyle(
                color: Color(0xFF475467),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
