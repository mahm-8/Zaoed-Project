import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:zaoed/Provider/Screens/Profile/profile_screen.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/finder/Profile/profile_screen.dart';
class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int currentIndex = 3;
  final List screens = [
    ProfileFinder(),
    Container(),
    Container(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors().gray1,
        selectedItemColor: AppColors().green,
        unselectedItemColor: AppColors().white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'lib/assets/icons/bookmark.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'lib/assets/icons/car.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'lib/assets/icons/map.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'lib/assets/icons/person.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
      ),
    ).asGlass();
  }
}
