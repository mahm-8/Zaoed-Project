import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/daily_profit_rate_chart.dart';
import 'package:zaoed/constants/colors.dart';

class DailyProfitRateChartContainer extends StatelessWidget {
  DailyProfitRateChartContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  final List dataProfitRate = [
    DataPoint(date: 'الأحد', profitRate: 20),
    DataPoint(date: 'الأثنين', profitRate: 12),
    DataPoint(date: 'الثلاثاء', profitRate: 6),
    DataPoint(date: 'الأربعاء', profitRate: 7),
    DataPoint(date: 'الخميس', profitRate: 2),
    DataPoint(date: 'الجمعة', profitRate: 25),
    DataPoint(date: 'السبت', profitRate: 3),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              subTitle,
              style: TextStyle(color: AppColors().white, fontSize: 16),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            DailyProfitRateChart(dataProfitRate: dataProfitRate),
          ],
        ),
      ),
    );
  }
}
