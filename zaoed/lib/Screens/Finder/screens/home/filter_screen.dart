import 'package:flutter/material.dart';
import 'package:zaoed/components/appbar/appbar_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/providor_show_dialogs/components/state_dialog.dart';
import 'component/charge_speed_container.dart';
import 'component/charger_filtiring_row.dart';
import 'component/rating_row.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: customAppBar(context,
          hasAction: true,
          showIcon: true,
          title: "التصفية",
          backTitle: "تطبيق", onPress: () {
        // show dialog done
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) {
            return const StateDialog(
              title: "تم التطبيق",
            );
          },
        );
        // if not filtiring not found
        // // show dialog or show empty list
        // dialog
        // showDialog(
        //   barrierColor: Colors.transparent,
        //   context: context,
        //   builder: (context) {
        //     return const ShowDialog(
        //       title: "عذرا لا تتوفر نقاط شحن بهذه المواصفات",
        //     );
        //   },
        // );

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      }),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "نوع الموصل",
                style: TextStyle(fontSize: 19, color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 14,
              ),
              const ChargerFiltiringRow(),
              const SizedBox(
                height: 40,
              ),
              Text(
                "تقييم نقطة الشحن",
                style: TextStyle(fontSize: 19, color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 14,
              ),
              const RatingRow(),
              const SizedBox(
                height: 40,
              ),
              Text(
                "سرعة الشحن",
                style: TextStyle(fontSize: 19, color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 14,
              ),
              const ChargeSpeedContainer()
            ],
          ),
        ),
      ),
    );
  }
}
