// import 'package:flutter/material.dart';
// import 'package:vehicle_Lock/screens/home_screen.dart';
// import 'package:vehicle_Lock/screens/notification_screen.dart';
// import 'package:vehicle_Lock/screens/profile_screen.dart';
// import 'package:vehicle_Lock/widgets/app_bar.dart';
// import 'package:vehicle_Lock/widgets/bottom_nav.dart';

// // class BaseLayout extends StatefulWidget {
// //   const BaseLayout({Key? key}) : super(key: key);

// //   @override
// //   _BaseLayoutState createState() => _BaseLayoutState();
// // }

// // class _BaseLayoutState extends State<BaseLayout> {
// //   int _currentIndex = 2;
// //   final GlobalKey<ScaffoldState> _scaffoldKey =
// //       GlobalKey<ScaffoldState>(); // Add this

// //   final List<Widget> _screens = [
// //     const Center(child: Text('Map Screen')),
// //     const Center(child: Text('Chart Screen')),
// //     const HomeScreen(),
// //     const NotificationScreen(),
// //     const ProfileScreen(),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       key: _scaffoldKey, // Assign the GlobalKey to the Scaffold
// //       backgroundColor: Colors.white,
// //       appBar: CustomAppBar(
// //           scaffoldKey: _scaffoldKey), // Pass the GlobalKey to CustomAppBar
// //       drawer: const CustomDrawer(),
// //       body: _screens[_currentIndex],
// //       bottomNavigationBar: CustomBottomNavigationBar(
// //         currentIndex: _currentIndex,
// //         onTap: (index) {
// //           setState(() {
// //             _currentIndex = index;
// //           });
// //         },
// //       ),
// //     );
// //   }
// // }

// class BaseLayout extends StatefulWidget {
//   final Widget? customBody; // Custom body for extended pages
//   final int? initialIndex; // Initial navigation index

//   const BaseLayout({super.key, this.customBody, this.initialIndex});

//   @override
//   _BaseLayoutState createState() => _BaseLayoutState();
// }

// class _BaseLayoutState extends State<BaseLayout> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   late int _currentIndex;
//   bool _isCustomBodyActive = false; // Track if customBody is active

//   final List<Widget> _defaultScreens = [
//     const Center(child: Text('Map Screen')),
//     const Center(child: Text('Chart Screen')),
//     const HomeScreen(),
//     const NotificationScreen(),
//     const ProfileScreen(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.initialIndex ?? 2; // Default to index 2 (HomeScreen)
//     _isCustomBodyActive =
//         widget.customBody != null; // Check if customBody is provided
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
//       drawer: const CustomDrawer(),
//       body: _isCustomBodyActive
//           ? widget.customBody
//           : _defaultScreens[_currentIndex],
//       bottomNavigationBar: CustomBottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//             _isCustomBodyActive =
//                 false; // Switch to default navigation when tapping a navigation item
//           });
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vehicle_Lock/screens/home_screen.dart';
import 'package:vehicle_Lock/screens/notification_screen.dart';
import 'package:vehicle_Lock/screens/profile_screen.dart';
import 'package:vehicle_Lock/widgets/app_bar.dart';
import 'package:vehicle_Lock/widgets/bottom_nav.dart';

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

  // Navigation history to store up to 5 previous states
  final List<int> _navigationHistory = [];

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
    _isCustomBodyActive = widget.customBody != null; // Check if customBody is provided
  }

  /// This method is called when the device back button is pressed.
  Future<bool> _onWillPop() async {
    debugPrint("Back button pressed.");

    // First, if a custom body is active, remove it.
    if (_isCustomBodyActive) {
      debugPrint("Custom body active. Reverting to default view.");
      setState(() {
        _isCustomBodyActive = false;
      });
      return false;
    }

    // Next, if there is navigation history available, pop to the last state.
    if (_navigationHistory.isNotEmpty) {
      final previousIndex = _navigationHistory.removeLast();
      debugPrint("Going back to previous index: $previousIndex");
      setState(() {
        _currentIndex = previousIndex;
      });
      return false; // Prevent further popping (exit)
    }

    // If there is no history, allow the system to handle the pop (e.g., exit app).
    debugPrint("No navigation history. Exiting the app or current route.");
    return true;
  }

  /// Handles bottom navigation taps. Stores the current state in history before switching.
  void _onNavigationTap(int index) {
    if (index == _currentIndex) return; // Do nothing if same tab is tapped

    // Save the current index in history if different
    _navigationHistory.add(_currentIndex);
    // Limit the history to the last 5 states
    if (_navigationHistory.length > 5) {
      _navigationHistory.removeAt(0);
    }
    debugPrint("Navigation tapped. Saving previous index and switching to index: $index");
    setState(() {
      _currentIndex = index;
      _isCustomBodyActive = false; // When a new navigation item is tapped, disable customBody
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
        drawer: const CustomDrawer(),
        body: _isCustomBodyActive ? widget.customBody : _defaultScreens[_currentIndex],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onNavigationTap,
        ),
      ),
    );
  }
}

