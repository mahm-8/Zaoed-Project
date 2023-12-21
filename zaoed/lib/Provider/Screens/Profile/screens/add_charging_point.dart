import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/AppBar/add_charging_app_bar.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/availability_hours.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/chargeing_type_section.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/charging_point_location.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/charging_point_text_field.dart';
import 'package:zaoed/constants/colors.dart';

// ignore: must_be_immutable
class AddChargingPoint extends StatelessWidget {
  AddChargingPoint({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: AddChargingScreenAppBar(context, title: 'إضافة نقطة شحن'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              AddChargingPointTextField(controller: controller),
              const ChargingPointLocation(),
              AvailabilityHours(),
              ChargingTypeSection()
            ],
          ),
        ),
      ),
    );
  }
}
