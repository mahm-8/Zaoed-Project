import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/daily_hours_rate_chart.dart';
import 'package:zaoed/constants/colors.dart';

class DailyHoursRateChartContainer extends StatelessWidget {
  DailyHoursRateChartContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  final List data = [
    DataPoint(date: 'الأحد', hoursRate: 11),
    DataPoint(date: 'الأثنين', hoursRate: 12),
    DataPoint(date: 'الثلاثاء', hoursRate: 6),
    DataPoint(date: 'الأربعاء', hoursRate: 7),
    DataPoint(date: 'الخميس', hoursRate: 2),
    DataPoint(date: 'الجمعة', hoursRate: 10),
    DataPoint(date: 'السبت', hoursRate: 3),
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
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              subTitle,
              style: TextStyle(color: AppColors().white, fontSize: 16),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            DailyHoursRateChart(data: data),
          ],
        ),
      ),
    );
  }
}
