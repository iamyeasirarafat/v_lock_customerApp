import 'package:flutter/material.dart';
import 'package:vehicle_Lock/screens/add_device_screen.dart';
import 'package:vehicle_Lock/widgets/custom_text_field.dart';
import 'package:vehicle_Lock/widgets/device_item.dart';

final List<Map<String, dynamic>> devicesList = [
  {
    'name': "Razu's BMW",
    'type': 'SMS Device',
    'iconUrl': 'assets/icon-1.png',
    'smsActive': true,
    'gpsActive': false,
    'networkLevel': 0,
    'batteryLevel': 0,
  },
  {
    'name': "Truck Godown",
    'type': 'GPS Pro Device',
    'iconUrl': 'assets/icon-2.png',
    'smsActive': true,
    'gpsActive': true,
    'networkLevel': 100,
    'batteryLevel': 75,
  },
  {
    'name': "Staff Bus 024",
    'type': 'GPS Pro Device',
    'iconUrl': 'assets/icon-3.png',
    'smsActive': true,
    'gpsActive': true,
    'networkLevel': 50,
    'batteryLevel': 50,
  },
  {
    'name': "Staff Bus 024",
    'type': 'GPS Pro Device',
    'iconUrl': 'assets/icon-4.png',
    'smsActive': true,
    'gpsActive': true,
    'networkLevel': 35,
    'batteryLevel': 35,
  },
  {
    'name': "Razu's Speedboat",
    'type': 'GPS Pro Device',
    'iconUrl': 'assets/icon-5.png',
    'smsActive': false,
    'gpsActive': false,
    'networkLevel': 0,
    'batteryLevel': 0,
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CustomTextField(
            hintText: 'Search vehicle',
            icon: Icons.search,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
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
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: devicesList.length,
              itemBuilder: (context, index) {
                return DeviceListItem(device: devicesList[index]);
              },
            ),
          ),
        ],
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
