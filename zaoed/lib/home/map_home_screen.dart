import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/home/home_screen.dart';

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
