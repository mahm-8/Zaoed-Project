import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/location_details.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingPointDataScreen extends StatelessWidget {
  const ChargingPointDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ProfailScreenAppBar(context, title: 'بيانات نقطة الشحن'),
      body: const Padding(
        padding: EdgeInsets.only(top: 16, left: 22.5, right: 18.5),
        child: Column(
          children: [
            LocationDetails(
              locationName: 'اسم الموقع',
              locationDetails: 'تفاصيل الموقع',
            ),
            LocationDetails(
              locationName: 'اسم الموقع',
              locationDetails: 'تفاصيل الموقع',
            )
          ],
        ),
      ),
    );
  }
}
