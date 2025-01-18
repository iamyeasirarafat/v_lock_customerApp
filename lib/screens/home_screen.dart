import 'package:flutter/material.dart';
import 'package:vehicle_Lock/screens/add_device_screen.dart';
import 'package:vehicle_Lock/widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomTextField(
              hintText: 'Search vehicle',
              icon: Icons.search,
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () => _dialogBuilder(context),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
              label: const Text(
                'Add Vehicle',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor, // Purple color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vehicle List',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Choose Device Type",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _buildDeviceButton(
                  title: "SMS Device",
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AddDevice(deviceType: "sms")));
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 10),
                _buildDeviceButton(
                  title: "GPS Device",
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AddDevice(deviceType: "gps")));
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildDeviceButton({
  required String title,
  required VoidCallback onPressed,
  required Color backgroundColor,
}) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B5CF6), // Purple color from image
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
