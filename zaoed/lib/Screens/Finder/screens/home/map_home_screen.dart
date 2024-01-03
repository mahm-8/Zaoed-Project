import 'dart:developer';

import 'package:zaoed/Screens/Finder/screens/home/google_map.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/bottom_sheet_status_bloc/bottom_sheet_status_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class MapHomeScreen extends StatefulWidget {
  const MapHomeScreen({super.key});

  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  @override
  void initState() {
    context.read<BottomSheetStatusBloc>().add(StatusBottomEvent());
    context.read<ActionsBloc>().add(GetChargingPointsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: BlocBuilder<BottomSheetStatusBloc, BottomSheetStatusState>(
        builder: (context, state) {
          if (state is SuccessStatusState) {
            final bottomSheetStatusBloc = context.read<BottomSheetStatusBloc>();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              bottomSheetStatusBloc.switchShowBottomSheet(
                context,
                state.status,
              );
            });
          }

          return Stack(children: [
            const Positioned.fill(child: GoogleMapScreen()),
            HomeScreen(),
          ]);
        },
      ),
    );
  }
}
