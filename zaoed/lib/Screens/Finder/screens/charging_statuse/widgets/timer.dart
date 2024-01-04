import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/text_style.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocConsumer<FinderBloc, FinderState>(
      listener: (context, state) {
        ///
        // TODO: implement listener
=======
    return BlocBuilder<FinderBloc, FinderState>(
      buildWhen: (previous, current) {
        if (current is TimerDataState) {
          return true;
        }
        return false;
>>>>>>> 67c72e5dced85de035492b5da477599d5729dd3c
      },
      builder: (context, state) {
        if (state is TimerDataState) {
          return Row(
            children: [
              Expanded(
                child: SizedBox(
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
                            value: 0,
                            width: 9,
                            color: AppColors().green,
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              state.remainingTime,
                              style: const TextStyle().style30,
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
                child: SizedBox(
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
                            value: state.completedPercentage,
                            width: 9,
                            color: AppColors().green,
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              '${state.completedPercentage.toStringAsFixed(0)}%',
                              style: const TextStyle().style30,
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
        return const Text('');
      },
    );
  }
}
