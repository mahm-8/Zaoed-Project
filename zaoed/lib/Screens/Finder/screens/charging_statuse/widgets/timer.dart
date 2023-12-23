import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
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

            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 10,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  radiusFactor: 0.7,
                  axisLineStyle: AxisLineStyle(
                    thickness: 9,
                    cornerStyle: CornerStyle.bothCurve,
                    color: AppColors().gray,

                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: remainingTime,
                      width: 9,
                      color: AppColors().green,
                      cornerStyle: CornerStyle.bothCurve,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(
                        '${remainingTime.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors().white,
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 200,

            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  radiusFactor: 0.7,
                  axisLineStyle: AxisLineStyle(
                    thickness: 9,
                    cornerStyle: CornerStyle.bothCurve,
                    color: AppColors().gray,

                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: completedPercentage,
                      width: 9,
                      color: AppColors().green,
                      cornerStyle: CornerStyle.bothCurve,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(
                        '${completedPercentage.toStringAsFixed(0)}%',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors().white,
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}