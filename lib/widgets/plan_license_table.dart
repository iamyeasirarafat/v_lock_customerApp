import 'package:flutter/material.dart';
import 'package:vehicle_Lock/widgets/custom_table_row.dart';
import 'package:vehicle_Lock/widgets/pagination.dart';

Widget planLicenseTable() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'All Your License Information',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Color(0xFF344054),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: const Text(
          "License",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
      Table(
        border: TableBorder.all(color: Colors.grey.shade300, width: 1),
        children: const [
          TableRow(children: [
            CustomTableRow(
              license: "PQVGRSSDDD",
              carName: "Razu's BMW",
              expiryDate: "15 Feb 2020 - 15 Feb 2021 ",
              expiresIn: "Expire in 15 Days",
            )
          ]),
          TableRow(children: [
            CustomTableRow(
              license: "PQVSDDDFDHS",
              carName: "Shaki's Corolla",
              expiryDate: "15 Aug 2024 - 30 Feb 2025",
              expiresIn: "Expire in 30 Days",
            )
          ])
        ],
      ),

      //pagination
      pagination()
    ],
  );
}
