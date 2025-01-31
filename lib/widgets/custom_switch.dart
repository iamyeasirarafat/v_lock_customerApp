import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String leftLabel;
  final String rightLabel;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.leftLabel,
    required this.rightLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          leftLabel,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: !value ? Colors.black87 : Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Theme.of(context).primaryColor,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE5E7EB),
            trackOutlineColor: WidgetStateProperty.resolveWith((states) {
              // Remove border when inactive
              if (!states.contains(WidgetState.selected)) {
                return Colors.transparent;
              }
              return null; // Use default color when active
            }),
          ),
        ),
        Text(
          rightLabel,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: value ? Colors.black87 : Colors.grey,
          ),
        ),
      ],
    );
  }
}