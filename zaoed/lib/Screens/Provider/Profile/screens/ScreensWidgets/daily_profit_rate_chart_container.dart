import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/daily_profit_rate_chart.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

class DailyProfitRateChartContainer extends StatelessWidget {
  const DailyProfitRateChartContainer({
    super.key,
    required this.title,
    required this.subTitle,
    required this.dataProfitRate,
  });

  final String title;
  final String subTitle;
  final List<dynamic>? dataProfitRate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 304,
      width: context.getWidth(),
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
            DailyProfitRateChart(dataProfitRate: [
              DataPoint(date: 'الأحد', profitRate: dataProfitRate?[1] ?? 0.0),
              DataPoint(date: 'الأثنين', profitRate: dataProfitRate?[2] ?? 0.0),
              DataPoint(
                  date: 'الثلاثاء', profitRate: dataProfitRate?[3] ?? 0.0),
              DataPoint(
                  date: 'الأربعاء', profitRate: dataProfitRate?[4] ?? 0.0),
              DataPoint(date: 'الخميس', profitRate: dataProfitRate?[5] ?? 0.0),
              DataPoint(date: 'الجمعة', profitRate: dataProfitRate?[6] ?? 0.0),
              DataPoint(date: 'السبت', profitRate: dataProfitRate?[0] ?? 0.0),
            ]),
          ],
        ),
      ),
    );
  }
}
