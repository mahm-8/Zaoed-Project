import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:zaoed/Provider/Screens/Profile/profile_screen.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/add_charging_point.dart';
import 'package:zaoed/constants/colors.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int currentIndex = 3;
  final List screens = [
    Container(),
    Container(),
    AddChargingPoint(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors().green,
        backgroundColor: AppColors().gray1,
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
      ).asGlass(
        tintColor: AppColors().gray1,
      ),
    );
  }
}
