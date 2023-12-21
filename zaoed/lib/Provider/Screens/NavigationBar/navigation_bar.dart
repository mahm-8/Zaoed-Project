import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:zaoed/Provider/Screens/Profile/profile_screen.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/add_charging_point.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/finder/Profile/profile_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int currentIndex = 3;
  final List screens = [
    const ProfileFinder(),
    Container(),
    const ProfileFinder(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 64,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors().green,
          unselectedItemColor: AppColors().white,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(
                'lib/assets/icons/bookmark.png',
              )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(
                'lib/assets/icons/car.png',
              )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(
                'lib/assets/icons/map.png',
              )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'lib/assets/icons/person.png',
                ),
                size: 29,
              ),
              label: '',
            ),
          ],
        ).asGlass(
          tintColor: Colors.transparent,
        ),
      ),
    );
  }
}
