import 'package:zaoed/Screens/Finder/screens/charging_statuse/charging_status_finished_screen.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/empty_car_charging_screen.dart';
import 'package:zaoed/blocs/finder_bloc/finder_bloc.dart';
import 'package:zaoed/constants/imports.dart';
import '../../../../blocs/charging_bloc/charging_bloc.dart';
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
              return const Column(
                children: [EmptyCarScreen()],
              );
            }
            if (state is ChargingStatus) {
              return const ChargingStatuesScreen();
            } else {
              return const EmptyChargingCarScreen();
            }
          },
        );
      }),
    );
  }
}
