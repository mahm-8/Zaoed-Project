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
              context.pushAndRemoveUntil(view: NavigationBarScreen());
            });
          } else {
            Future.delayed(const Duration(seconds: 3), () {
              context.pushAndRemoveUntil(view: FinderNavigationBarScreen());
            });
          }
        } else if (newState is ErrorCheckState) {
          context.pushAndRemoveUntil(view: const TabBarLogin());
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
