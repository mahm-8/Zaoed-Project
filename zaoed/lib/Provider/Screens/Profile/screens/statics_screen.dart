import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/rate_container.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';
import 'package:fl_chart/fl_chart.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ProfailScreenAppBar(context, title: 'الاحصائيات'),
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/MAP.png',
            width: context.getWidth(),
            height: context.getHeight(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                const RateContainer(
                  title: 'معدل الربح اليومي',
                  subTitle: '50 ريال',
                ).asGlass(
                    tintColor: AppColors().gray1,
                    clipBorderRadius: BorderRadius.circular(8)),
                const SizedBox(
                  height: 16,
                ),
                const RateContainer(
                  title: 'معدل الساعات اليومية',
                  subTitle: '10 ساعات 28 دقيقة',
                ).asGlass(
                    tintColor: AppColors().gray1,
                    clipBorderRadius: BorderRadius.circular(8))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
