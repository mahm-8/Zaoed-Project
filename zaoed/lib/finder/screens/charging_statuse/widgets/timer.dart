
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zaoed/constants/colors.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
    required this.remainingTime,
    required this.completedPercentage,
  });

  final double remainingTime;
  final double completedPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            child: SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries(
                  dataSource: <ChartData>[
                    ChartData('Remaining', remainingTime),
                    ChartData('Total', 10),
                  ],
                  pointColorMapper: (data, _) =>
                      data.label == 'Remaining'
                          ? AppColors().green
                          : AppColors().gray,
                  enableTooltip: false,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: false,
                  ),
                  xValueMapper: (data, _) => data.label,
                  yValueMapper: (data, _) => data.value,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            child: SfCircularChart(
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                  dataSource: <ChartData>[
                    ChartData('Completed', completedPercentage),
                    ChartData(
                        'Remaining', 100 - completedPercentage),
                  ],
                  pointColorMapper: (data, _) =>
                      data.label == 'Completed'
                          ? AppColors().green
                          : AppColors().gray,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: false,
                  ),
                  xValueMapper: (ChartData data, _) =>
                      data.label,
                  yValueMapper: (ChartData data, _) =>
                      data.value,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.label, this.value);

  final String label;
  final double value;
}
