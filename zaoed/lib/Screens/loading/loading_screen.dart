import 'package:zaoed/constants/imports.dart';

import '../../blocs/actions_bloc/actions_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, newState) {
        if (newState is CheckLoginState) {
          context.read<ActionsBloc>().add(GetChargingPointsEvent());
          context.read<ProviderBloc>().add(GetProviderChargingPointsEvent());
          context.read<CardBloc>().add(GetCardDateEvent());
          context.read<FinderBloc>().add(LoadDataTimerEvent());
          context.read<ChargingBloc>().add(EmptyCarsEvent());
          context.read<GoogleMapBloc>().add(FetchMarkersEvent());
          context.read<CarsBloc>().add(CarsDataEvent());
          context.read<UserBloc>().add(GetUserDataEvent());
          if (newState.type == 'provider') {
            Future.delayed(const Duration(seconds: 4), () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NavigationBarScreen()),
                  (route) => false);
            });
          } else {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FinderNavigationBarScreen()),
                  (route) => false);
            });
          }
        } else if (newState is ErrorCheckState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const TabBarLogin()),
              (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors().gray9,
          body: Center(
            child: Image.asset("lib/assets/images/ZaoedLogo.png"),
          ),
        );
      },
    );
  }
}
