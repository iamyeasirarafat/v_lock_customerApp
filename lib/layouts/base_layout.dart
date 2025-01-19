import 'package:flutter/material.dart';
import 'package:vehicle_Lock/screens/home_screen.dart';
import 'package:vehicle_Lock/screens/notification_screen.dart';
import 'package:vehicle_Lock/screens/profile_screen.dart';
import 'package:vehicle_Lock/widgets/app_bar.dart';
import 'package:vehicle_Lock/widgets/bottom_nav.dart';

// class BaseLayout extends StatefulWidget {
//   const BaseLayout({Key? key}) : super(key: key);

//   @override
//   _BaseLayoutState createState() => _BaseLayoutState();
// }

// class _BaseLayoutState extends State<BaseLayout> {
//   int _currentIndex = 2;
//   final GlobalKey<ScaffoldState> _scaffoldKey =
//       GlobalKey<ScaffoldState>(); // Add this

//   final List<Widget> _screens = [
//     const Center(child: Text('Map Screen')),
//     const Center(child: Text('Chart Screen')),
//     const HomeScreen(),
//     const NotificationScreen(),
//     const ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(
//           scaffoldKey: _scaffoldKey), // Pass the GlobalKey to CustomAppBar
//       drawer: const CustomDrawer(),
//       body: _screens[_currentIndex],
//       bottomNavigationBar: CustomBottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }

class BaseLayout extends StatefulWidget {
  final Widget? customBody; // Custom body for extended pages
  final int? initialIndex; // Initial navigation index

  const BaseLayout({super.key, this.customBody, this.initialIndex});

  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late int _currentIndex;
  bool _isCustomBodyActive = false; // Track if customBody is active

  final List<Widget> _defaultScreens = [
    const Center(child: Text('Map Screen')),
    const Center(child: Text('Chart Screen')),
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex ?? 2; // Default to index 2 (HomeScreen)
    _isCustomBodyActive =
        widget.customBody != null; // Check if customBody is provided
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: const CustomDrawer(),
      body: _isCustomBodyActive
          ? widget.customBody
          : _defaultScreens[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _isCustomBodyActive =
                false; // Switch to default navigation when tapping a navigation item
          });
        },
      ),
    );
  }
}
