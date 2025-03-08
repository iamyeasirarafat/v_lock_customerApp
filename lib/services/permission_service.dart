// lib/services/permission_service.dart
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  final Map<Permission, String> _requiredPermissions = {
    // Permission.storage: 'Storage',
    // Permission.locationWhenInUse: 'Location',
    Permission.sms: 'SMS',
    // Permission.phone: 'Call Logs',
  };

  Future<bool> checkAndRequestPermissions() async {
    bool allGranted = true;

    for (final permission in _requiredPermissions.keys) {
      final status = await permission.status;

      if (!status.isGranted) {
        final result = await permission.request();
        if (!result.isGranted) {
          allGranted = false;
          // Handle permanently denied permissions
          if (result.isPermanentlyDenied) {
            await openAppSettings();
          }
        }
      }
    }

    return allGranted;
  }

  Future<void> openAppSettings() async {
    await openAppSettings();
  }
}
