
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zaoed/constants/colors.dart';

class DailyHoursRateChart extends StatelessWidget {
  const DailyHoursRateChart({super.key, required this.data});
  final List data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 164,
      width: 308,
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
            dataSource: data,
            color: AppColors().green,
            width: 0.3,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            xValueMapper: (point, _) => point.date,
            yValueMapper: (point, _) => point.hoursRate,
          ),
        ],
      ),
    );
  }
}

class DataPoint {
  final String date;
  final double hoursRate;

  DataPoint({required this.date, required this.hoursRate});
}
