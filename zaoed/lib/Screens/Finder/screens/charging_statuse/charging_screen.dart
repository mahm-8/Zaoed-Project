import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/widgets/car_information.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/widgets/charging_app_bar.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/widgets/charging_car.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/widgets/location_information.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/widgets/price_information.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/widgets/timer.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingStatuesScreen extends StatefulWidget {
  @override
  _ChargingStatuesScreenState createState() => _ChargingStatuesScreenState();
}

class _ChargingStatuesScreenState extends State<ChargingStatuesScreen> {
  double remainingTime = 100;
  double completedPercentage = 50;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timerToCompleted();
  }
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
  timerToCompleted() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
          completedPercentage += 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ChargingAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChargingCar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarInformation(),
                  SizedBox(
                    height: 8,
                  ),
                  LocationInformation(),
                  SizedBox(
                    height: 16,
                  ),
                  PriceInformation(),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors().gray6,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 350,
                    height: 150,
                    child: TimerWidget(
                        remainingTime: remainingTime,
                        completedPercentage: completedPercentage),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
