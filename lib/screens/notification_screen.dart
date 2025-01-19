import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vehicle_Lock/widgets/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationData> notifications = [
    NotificationData(
      title: 'Toyota Camry XL07 | Geo Fence Crossed',
      description: 'Your Car Toyota is crossed the Geo Fence radius of 3Km',
      primaryAction: ActionButton(
        label: 'See On Map',
        onTap: () {},
      ),
      secondaryAction: ActionButton(
        label: 'Dismiss',
        onTap: () {},
      ),
      icon: Icons.warning_amber_rounded,
    ),
    NotificationData(
      title: 'Subscription Expire on 7 Days',
      description: 'Please renew your GPS Subscription of device "Raju\'s BMW"',
      secondaryAction: ActionButton(
        label: 'Dismiss',
        onTap: () {},
      ),
      icon: Icons.warning_amber_rounded,
    ),
  ];

  void clearAllNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  void removeNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notification',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF212325),
                ),
              ),
              TextButton.icon(
                onPressed: clearAllNotifications,
                icon: SvgPicture.asset(
                  "assets/delete.svg",
                  height: 16,
                  width: 16,
                  color: const Color(0xFF344054),
                ),
                label: const Text(
                  'Delete All Notification',
                  style: TextStyle(fontSize: 12),
                ),
                iconAlignment: IconAlignment.end,
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF344054),
                  backgroundColor: const Color(0xFFF2F4F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: Color(0xFFE4E7EC),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: NotificationItem(
                    data: notifications[index],
                    onDismiss: () => removeNotification(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
