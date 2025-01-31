import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StatusIndicator({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 8.0, right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[50], // Lighter background
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey[300]!, // Light grey border
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 3.0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20.0,
            color: Colors.grey[700],
          ),
          const SizedBox(width: 8.0),
          Text(
            '$label: $value',
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF344054),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
