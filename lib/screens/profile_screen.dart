import 'package:flutter/material.dart';
import 'package:vehicle_Lock/widgets/personal_details_form.dart';
import 'package:vehicle_Lock/widgets/plan_license_table.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header Section
          const Stack(
            children: [
              // Background gradient
              SizedBox(
                height: 100,
                width: double
                    .infinity, // Ensures the image takes up the full width
                child: Image(
                  image: AssetImage('assets/bg_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 120),
              // Profile avatar
              Positioned.fill(
                right: 290.00,
                top: 20.00,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/person.jpg'), // Replace with your asset
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // To compensate for the avatar's overlap

          // Content inside the Tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // Make container full width
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Align items to start
                    children: [
                      _buildToggleItem(
                        0,
                        'Profile details',
                      ),
                      const SizedBox(width: 4),
                      _buildToggleItem(
                        1,
                        'Plan & License',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                selectedIndex == 0
                    ? personalDetailsForm(context)
                    : planLicenseTable()
              ],
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }

  Widget _buildToggleItem(int index, String text) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black87 : Colors.grey[600],
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
