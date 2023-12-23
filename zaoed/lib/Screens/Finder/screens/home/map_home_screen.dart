import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/home/home_screen.dart';
import 'package:zaoed/constants/colors.dart';

class MapHomeScreen extends StatelessWidget {
  const MapHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      body: const Stack(children: [
        //add  google map
        HomeScreen(),
      ]),
    );
  }
}
