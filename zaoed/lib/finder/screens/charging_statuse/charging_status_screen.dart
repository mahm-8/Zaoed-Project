import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/finder/screens/charging_statuse/widgets/charging_app_bar.dart';
import 'package:zaoed/finder/screens/charging_statuse/widgets/charging_car.dart';

class ChargingStatusFinishedScreen extends StatelessWidget {
  const ChargingStatusFinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ChargingAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChargingCar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 151),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'انتهت عملية الشحن',
                    style: TextStyle(color: AppColors().white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'يمكنك استلام مركبتك الآن! نأمل منك إتمام عملية الاستلام خلال ٢٠ دقيقة',
                    style: TextStyle(
                      color: AppColors().gray,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                      textEntry: 'استلام المركبة',
                      backColor: AppColors().green,
                      onPress: () {},
                      textColor: AppColors().white)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
