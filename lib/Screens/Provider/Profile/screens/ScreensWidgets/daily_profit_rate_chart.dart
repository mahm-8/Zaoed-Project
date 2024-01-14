import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

class DailyProfitRateChart extends StatelessWidget {
  const DailyProfitRateChart({super.key, required this.dataProfitRate});

  final List dataProfitRate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      width: context.getWidth(),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: const CategoryAxis(
          labelRotation: 45,
          isInversed: true,
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0),
        ),
        primaryYAxis: const NumericAxis(
          opposedPosition: true,
          edgeLabelPlacement: EdgeLabelPlacement.hide,
          labelPosition: ChartDataLabelPosition.outside,
          axisLine: AxisLine(color: Colors.transparent),
          labelStyle: TextStyle(
            fontSize: 12,
          ),
        ),
        series: [
          ColumnSeries(
            dataSource: dataProfitRate,
            color: AppColors().green,
            width: 0.3,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            xValueMapper: (point, _) => point.date,
            yValueMapper: (point, _) => point.profitRate,
          ),
        ],
      ),
    );
  }
}

class DataPoint {
  final String date;
  final double profitRate;

  DataPoint({required this.date, required this.profitRate});
}
