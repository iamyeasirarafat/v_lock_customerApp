import 'package:flutter/material.dart';
import 'package:vehicle_Lock/layouts/base_layout.dart';

class DeviceSettingsScreen extends StatefulWidget {
  const DeviceSettingsScreen({Key? key}) : super(key: key);

  @override
  State<DeviceSettingsScreen> createState() => _DeviceSettingsScreenState();
}

class _DeviceSettingsScreenState extends State<DeviceSettingsScreen> {
  String updateInterval = '15s';
  String vibrationSetting = 'Low';

  final List<String> intervals = [
    '5s',
    '10s',
    '15s',
    '20s',
    '30s',
    '60s',
    '90s',
    '120s'
  ];
  final List<String> vibrationLevels = ['Low', 'Medium', 'High'];

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      customBody: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Device Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildSettingItem(
                'Update Interval Setting',
                updateInterval,
                intervals,
                (value) => setState(() => updateInterval = value!),
              ),
              const SizedBox(height: 16),
              _buildSettingItem(
                'Vibration Sensor Setting',
                vibrationSetting,
                vibrationLevels,
                (value) => setState(() => vibrationSetting = value!),
              ),
              // const Spacer(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildButton(
                      'Back',
                      onPressed: () => Navigator.pop(context),
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildButton(
                      'Update',
                      onPressed: () {
                        // Handle update logic here
                        Navigator.pop(context, {
                          'interval': updateInterval,
                          'vibration': vibrationSetting,
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    String value,
    List<String> items,
    void Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 4),
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black54,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                itemBuilder: (context) => items
                    .map(
                      (item) => PopupMenuItem(
                        value: item,
                        child: Text(item),
                      ),
                    )
                    .toList(),
                onSelected: onChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    String text, {
    required VoidCallback onPressed,
    bool isOutlined = false,
  }) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : Colors.white,
          foregroundColor: isOutlined ? Colors.black54 : Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
