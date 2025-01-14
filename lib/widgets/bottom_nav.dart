// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomBottomNavigationBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 15,
//             spreadRadius: 2,
//             offset: Offset(0, -2),
//           ),
//         ],
//         border: Border(
//           top: BorderSide(color: Colors.grey.shade300, width: 1),
//         ),
//       ),
//       height: 80,
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle: const TextStyle(fontSize: 12),
//         unselectedLabelStyle: const TextStyle(fontSize: 12),
//         currentIndex: currentIndex,
//         onTap: onTap,
//         items: [
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/map.svg",
//                 colorFilter: ColorFilter.mode(
//                     currentIndex == 0
//                         ? Theme.of(context).primaryColor
//                         : Colors.grey,
//                     BlendMode.srcIn),
//                 width: 26,
//                 height: 26,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/chart.svg",
//                 colorFilter: ColorFilter.mode(
//                     currentIndex == 1
//                         ? Theme.of(context).primaryColor
//                         : Colors.grey,
//                     BlendMode.srcIn),
//                 width: 26,
//                 height: 26,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/home.svg",
//                 colorFilter: ColorFilter.mode(
//                     currentIndex == 2
//                         ? Theme.of(context).primaryColor
//                         : Colors.grey,
//                     BlendMode.srcIn),
//                 width: 26,
//                 height: 26,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/notification.svg",
//                 colorFilter: ColorFilter.mode(
//                     currentIndex == 3
//                         ? Theme.of(context).primaryColor
//                         : Colors.grey,
//                     BlendMode.srcIn),
//                 width: 26,
//                 height: 26,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/profile.svg",
//                 colorFilter: ColorFilter.mode(
//                     currentIndex == 4
//                         ? Theme.of(context).primaryColor
//                         : Colors.grey,
//                     BlendMode.srcIn),
//                 width: 26,
//                 height: 26,
//               ),
//               label: ''),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor, // Purple background
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.6),
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            currentIndex: currentIndex,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/map.svg",
                  colorFilter: ColorFilter.mode(
                    currentIndex == 0
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
                label: 'Location',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/chart.svg",
                  colorFilter: ColorFilter.mode(
                    currentIndex == 1
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
                label: 'History',
              ),
              // Empty space for the floating button
              const BottomNavigationBarItem(
                icon: SizedBox(height: 24),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/notification.svg",
                  colorFilter: ColorFilter.mode(
                    currentIndex == 3
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/profile.svg",
                  colorFilter: ColorFilter.mode(
                    currentIndex == 4
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
        // Floating home button
        // Positioned(
        //   top: -25,
        //   left: 0,
        //   right: 0,
        //   child: GestureDetector(
        //     onTap: () => onTap(2),
        //     child: Container(
        //       width: 64,
        //       height: 64,
        //       padding: const EdgeInsets.all(16),
        //       decoration: BoxDecoration(
        //         gradient: const LinearGradient(
        //           colors: [
        //             Color(0xFF7F56D9),
        //             Color(0xFF9E77ED),
        //           ],
        //           begin: FractionalOffset(0.0, 0.0),
        //           end: FractionalOffset(1.0, 0.0),
        //           stops: [0.0, 1.0],
        //           tileMode: TileMode.clamp,
        //         ),
        //         // shape: BoxShape.values.single,
        //         borderRadius: BorderRadius.circular(16),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.3),
        //             blurRadius: 15,
        //             spreadRadius: 0,
        //             offset: const Offset(0, 12),
        //           ),
        //         ],
        //       ),
        //       child: SvgPicture.asset(
        //         "assets/home.svg",
        //         colorFilter: ColorFilter.mode(
        //           currentIndex == 2
        //               ? Colors.white
        //               : Colors.white.withOpacity(0.6),
        //           BlendMode.srcIn,
        //         ),
        //         width: 20,
        //         height: 20,
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          child: Center(
            // Add this wrapper
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                width: 56, // Change from 64 to 56 for smaller width
                height: 56, // Change from 64 to 56 to match width
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF7F56D9),
                      Color(0xFF9E77ED),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 0,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/home.svg",
                      colorFilter: ColorFilter.mode(
                        currentIndex == 2
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                        BlendMode.srcIn,
                      ),
                      width: 28,
                      height: 28,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
