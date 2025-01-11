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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, -2),
          ),
        ],
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      height: 80,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/map.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    BlendMode.srcIn),
                width: 26,
                height: 26,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/chart.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 1
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    BlendMode.srcIn),
                width: 26,
                height: 26,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 2
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    BlendMode.srcIn),
                width: 26,
                height: 26,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/notification.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 3
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    BlendMode.srcIn),
                width: 26,
                height: 26,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/profile.svg",
                colorFilter: ColorFilter.mode(
                    currentIndex == 4
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    BlendMode.srcIn),
                width: 26,
                height: 26,
              ),
              label: ''),
        ],
      ),
    );
  }
}
