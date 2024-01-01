import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/blocs/finder_bloc/finder_bloc.dart';

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
    return BlocConsumer<FinderBloc, FinderState>(
      listener: (context, state) {
        // TODO: implement listener
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
        return const Text('');
      },
    );
  }
}
