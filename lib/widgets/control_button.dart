import 'package:flutter/material.dart';

Widget buildControlButton(IconData icon, String label, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    radius: 12,
    child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD1E0FF), // Lighter blue background
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.black87,
              size: 28, // Slightly larger icon
            ),
            const SizedBox(height: 6), // Reduced spacing
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )),
  );
}

class ControlButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onTap;

  const ControlButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }
}
