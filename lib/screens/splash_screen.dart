import 'package:flutter/material.dart';
import 'package:vehicle_Lock/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _dragPosition = 10;
  final double _dragThreshold = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/splash.png',
              fit: BoxFit.cover,
            ),
          ),
          // Swipe to Start Section
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 297,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      const Center(
                        child: Text(
                          "Swipe to Start",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // Draggable Icon
                      Positioned(
                        left: _dragPosition,
                        top: 10,
                        child: GestureDetector(
                          onPanUpdate: (details) {
                            setState(() {
                              // Update drag position while keeping it within bounds
                              _dragPosition += details.delta.dx;
                              _dragPosition =
                                  _dragPosition.clamp(0.0, _dragThreshold);
                            });
                          },
                          onPanEnd: (details) {
                            if (_dragPosition >= _dragThreshold) {
                              // Navigate to Login Page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            } else {
                              // Reset the position if not fully dragged
                              setState(() {
                                _dragPosition = 10;
                              });
                            }
                          },
                          child: Container(
                            width: 42,
                            height: 42,
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
