import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
          
          // TabBar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'Profile details'),
                Tab(text: 'Plan & License'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Content inside the Tab
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Update your photo and personal details.',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),

          // Form Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(label: 'First name', hintText: 'Olivia'),
                SizedBox(height: 16),
                CustomTextField(label: 'Last name', hintText: 'Rhye'),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Email address',
                  hintText: 'olivia@untitledui.com',
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Phone Number',
                  hintText: '0194458271',
                  icon: Icons.phone,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icon;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label *',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon:
                icon != null ? Icon(icon, size: 20, color: Colors.grey) : null,
            filled: true,
            fillColor: Colors.grey.shade100,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade300),
            ),
          ),
        ),
      ],
    );
  }
}
