import 'package:flutter/material.dart';

Widget pagination() {
  final TextEditingController _controller = TextEditingController(text: "1");
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 12,
    ),
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide.none,
        left: BorderSide(width: 1, color: Colors.grey.shade300),
        right: BorderSide(width: 1, color: Colors.grey.shade300),
        bottom: BorderSide(width: 1, color: Colors.grey.shade300),
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    child: Row(
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey.shade300, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.zero,
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Color(0xFF344054),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            const Text(
              "Page",
              style: TextStyle(
                  color: Color(0xFF344054),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 10),
            Container(
              height: 40,
              width: 40,
              // padding: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 8),
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                    color: Color(0xFF344054),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "of 10",
              style: TextStyle(
                  color: Color(0xFF344054),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const Spacer(),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey.shade300, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.zero,
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(
            Icons.arrow_forward,
            size: 20,
            color: Color(0xFF344054),
          ),
        ),
      ],
    ),
  );
}
