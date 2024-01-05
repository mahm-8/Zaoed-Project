// ignore_for_file: file_names

import 'package:zaoed/constants/imports.dart';

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
          print("state========$state");
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
