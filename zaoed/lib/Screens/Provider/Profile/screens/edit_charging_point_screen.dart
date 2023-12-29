import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/add_charging_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/availability_hours.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/chargeing_type_section.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/charging_point_location.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/charging_point_text_field.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/constants/imports.dart';

// ignore: must_be_immutable
class EditChargingPointScreen extends StatelessWidget {
  EditChargingPointScreen({super.key, required this.bloc});
  final ProviderBloc bloc;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: addChargingScreenAppBar(context,
          title: 'تعديل نقطة شحن', isEditing: true, editFunc: () {
        context.read<ProviderBloc>().add(EditChargingPointEvent(
            // chargingCount ??????
            chargingPointName: controller.text,
            chargingCount: 0));
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              AddChargingPointTextField(
                textController: controller,
                isEdit: true,
              ),
              // Text(bloc),
              // how to edit the old location
              ChargingPointLocation(),
              AvailabilityHours(
                bloc: bloc,
              ),
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
