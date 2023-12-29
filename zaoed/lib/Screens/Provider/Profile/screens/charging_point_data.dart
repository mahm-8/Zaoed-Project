import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/location_details.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/add_charging_point.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

class ChargingPointDataScreen extends StatelessWidget {
  const ChargingPointDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();

    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'بيانات نقطة الشحن'),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 22.5, right: 18.5, bottom: 27),
        child: Column(
          children: [
            // add bloc builder??
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return LocationDetails(
                  locationName:
                      bloc.bookmarkData?[index].chargingPoint.pointName,
                  locationDetails:
                      "longtude: ${bloc.bookmarkData?[index].chargingPoint.longitude}, latitude: ${bloc.bookmarkData?[index].chargingPoint.latitude}",
                  index: index,
                  bloc: bloc,
                );
              },
            ),
            const Spacer(),
            ButtonWidget(
              textEntry: "إضافة نقطة شحن",
              backColor: AppColors().green,
              textColor: AppColors().white,
              onPress: () {
                context.push(view: AddChargingPoint());
              },
            )
          ],
        ),
      ),
    );
  }
}
