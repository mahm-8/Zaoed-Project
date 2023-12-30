import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/charging_status_finished_screen.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/empty_car_charging_screen.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/widgets/charging_app_bar.dart';
import 'package:zaoed/blocs/finder_bloc/finder_bloc.dart';
import 'package:zaoed/constants/imports.dart';

import '../../../../blocs/charging_bloc/charging_bloc.dart';
import '../../../../constants/colors.dart';
import 'charging_statuse_screen.dart';
import 'empty_car_screen.dart';

class ChargingScreen extends StatelessWidget {
  const ChargingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<CarsBloc>();
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: chargingAppBar(context),
      body: BlocBuilder<FinderBloc, FinderState>(builder: (context, state) {
        if (state is TimerDataState) {
          if (state.completedPercentage == 100) {
            return ChargingStatusFinishedScreen();
          }
        }

        return BlocBuilder<ChargingBloc, ChargingState>(
          builder: (context, state) {
            if (state is EmptyCarState) {
              print("1");
              return const Column(
                children: [EmptyCarScreen()],
              );
            }
            if (state is ChargingStatus) {
              print("2");
              return const ChargingStatuesScreen();
            } else {
              print("3");
              return const EmptyChargingCarScreen();
            }
          },
        );
      }),
    );
  }
}
