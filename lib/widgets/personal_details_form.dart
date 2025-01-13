import 'package:flutter/material.dart';
import 'package:vehicle_Lock/widgets/custom_text_field.dart';

Widget personalDetailsForm(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text(
      'Personal info',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    const SizedBox(height: 4),
    const Text(
      'Update your photo and personal details.',
      style: TextStyle(color: Colors.grey),
    ),
    const SizedBox(height: 20),
    Container(
        width: double.infinity, // Make container full width
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: const Column(
          children: [
            CustomTextField(label: 'First name', hintText: 'Olivia'),
            SizedBox(height: 24),
            CustomTextField(label: 'Last name', hintText: 'Rhye'),
            SizedBox(height: 24),
            CustomTextField(
              label: 'Email address',
              hintText: 'olivia@untitledui.com',
              icon: Icons.mail_outline_rounded,
            ),
            SizedBox(height: 24),
            CustomTextField(
              label: 'Phone Number',
              hintText: '0194458271',
              icon: Icons.phone,
            ),
            SizedBox(height: 24),
            CustomTextField(
              label: 'Address',
              hintText: '4506 mcintosh road, new york',
              icon: Icons.home_outlined,
            ),
          ],
        )),
    Container(
      width: double.infinity, // Make container full width
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )),
            child: const Text("Cancel",
                style: TextStyle(
                    color: Color(0xFF344054),
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(Theme.of(context).primaryColor),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )),
            child: const Text("Save Changes",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    )
  ]);
}
