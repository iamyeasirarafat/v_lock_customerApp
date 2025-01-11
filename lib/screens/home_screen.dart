// import 'package:flutter/material.dart';
// import 'package:vehicle_Lock/widgets/bottom_nav.dart';
// import 'package:vehicle_Lock/widgets/home_main_widget.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.deepPurple,
//         title: const Padding(
//           padding: EdgeInsets.symmetric(vertical: 12),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 20,
//                 backgroundImage: AssetImage('assets/person.jpg'),
//                 backgroundColor: Colors.white,
//                 // child: Image.asset('assets/person.jpg', width: 32, height: 32),
//               ),
//               SizedBox(width: 10),
//               Text('Hi, Razu Rahman', style: TextStyle(color: Colors.white)),
//             ],
//           ),
//         ),
//         actions: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             margin: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Row(
//               children: [
//                 Icon(Icons.circle, color: Colors.green, size: 12),
//                 SizedBox(width: 4),
//                 Text('Solo', style: TextStyle(color: Colors.black)),
//               ],
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () => _scaffoldKey.currentState?.openDrawer(),
//             color: Colors.white,
//           ),
//         ],
//       ),

//       // Side Navigation Drawer
//       drawer: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(color: Colors.white),
//               child: Center(
//                 child: Image.asset('assets/logo.png', height: 80),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 children: [
//                   ListTile(
//                     leading: const Icon(Icons.home),
//                     title: const Text('Home'),
//                     onTap: () {},
//                   ),
//                   ListTile(
//                     leading: const Icon(Icons.settings),
//                     title: const Text('Settings'),
//                     onTap: () {},
//                   ),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('Logout'),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//       body: HomeMainWidget(),
//       // Bottom Navigation
//       bottomNavigationBar: CustomBottomNavBar(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vehicle_Lock/widgets/control_button.dart';

class HomeScreen extends StatelessWidget {
    final List<Map<String, dynamic>> carData = [
    {
      'id': '1',
      'name': 'Toyota Camry',
      'image': 'assets/car.png',
    },
    {
      'id': '2',
      'name': 'Honda Civic',
      'image': 'assets/car.png',
    },
    {
      'id': '3',
      'name': 'Ford Focus',
      'image': 'assets/car.png',
    }
    // Add more cars as needed
  ];
 
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Car Slider
        Container(
          height: 120,
          child: PageView.builder(
            itemCount: carData.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey[900],
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/car.png",
                        width: 100,
                        height: 85,
                      ),
                      // Transform.rotate(angle: pi, child: Image.asset(carData[index]['image'], width: 10, height: 10,)),
                      Column(
                        children: [
                          Text(
                            carData[index]['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Enter License To Activate GPS',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(Icons.arrow_forward, color: Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            },
          ),
        ),

        // SMS Status
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Chip(
            avatar: Icon(Icons.circle, color: Colors.green, size: 12),
            label: Text('SMS Activated'),
            backgroundColor: Colors.white,
          ),
        ),

        // Control Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      label: const Text('Lock On/Off',
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.lock),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          iconColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      label: const Text('Alarm On/Off',
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.notifications),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          iconColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      label: const Text('Location',
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.location_on),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen[400],
                          iconColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      label: const Text('Status',
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.person_search_outlined),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen[400],
                          iconColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Other Controls
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Other Control',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: [
                  BuildControlButton(Icons.power_settings_new, 'Power'),
                  BuildControlButton(Icons.volume_up, 'Sensitivity'),
                  BuildControlButton(Icons.security, 'Theft'),
                  BuildControlButton(Icons.phone, 'Call'),
                  BuildControlButton(Icons.timer, '2min Lock'),
                  BuildControlButton(Icons.headset_mic, 'HelpLine'),
                ],
              ),
            ],
          ),
        ),

        // Settings Button
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[50],
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                minimumSize: Size(double.infinity, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Go To Settings',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Device Number Set & Settings',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.history, color: Colors.black, size: 30),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
  }
}
