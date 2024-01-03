import 'package:zaoed/Screens/Finder/screens/charging_statuse/charging_status_finished_screen.dart';
import 'package:zaoed/Screens/Finder/screens/charging_statuse/empty_car_charging_screen.dart';
import 'package:zaoed/constants/imports.dart';
import '../../../../blocs/charging_bloc/charging_bloc.dart';
import 'empty_car_screen.dart';

class ChargingScreen extends StatelessWidget {
  const ChargingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ChargingBloc>().add(EmptyCarsEvent());
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: chargingAppBar(context),
      body: BlocBuilder<ChargingBloc, ChargingState>(
        builder: (context, state) {
          print("here i am $state");
          if (state is ChargingStatus) {
            return const ChargingStatuesScreen();
          } else if (state is EmptyBookingState) {
            return const EmptyChargingCarScreen();
          } else if (state is ChargingFinishedStatus) {
            return const ChargingStatusFinishedScreen();
          } else {
            return const EmptyCarScreen();
          }
        },
      ),
    );
  }
}
