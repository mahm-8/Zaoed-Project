import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/add_charging_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/availability_hours.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/chargeing_type_section.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/charging_point_location.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/charging_point_text_field.dart';
import 'package:zaoed/constants/colors.dart';

// ignore: must_be_immutable
class EditChargingPointScreen extends StatelessWidget {
  EditChargingPointScreen({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: addChargingScreenAppBar(context,
          title: 'تعديل نقطة شحن', isEditing: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              AddChargingPointTextField(
                textController: controller,
                isEdit: true,
              ),
              ChargingPointLocation(),
              AvailabilityHours(),
              // edit charging type get count from bloc
              const ChargingTypeSection(
                isEdit: true,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
