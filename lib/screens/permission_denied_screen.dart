import 'package:flutter/material.dart';

class PermissionDeniedScreen extends StatelessWidget {
  const PermissionDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Required permissions were denied'),
            Text('Please allow them in settings'),
            // ElevatedButton(
            //   onPressed: () => {

            //   },
            //   child: const Text('Open Settings'),
            // )
          ],
        ),
      ),
    );
  }
}
