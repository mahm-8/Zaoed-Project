import 'dart:developer';

import 'package:zaoed/Screens/Finder/screens/home/google_map.dart';
import 'package:zaoed/blocs/bottom_sheet_status_bloc/bottom_sheet_status_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class MapHomeScreen extends StatelessWidget {
  const MapHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BottomSheetStatusBloc>().add(StatusBottomEvent());
    return Scaffold(
      // extendBody: true,
      body: BlocBuilder<BottomSheetStatusBloc, BottomSheetStatusState>(
        builder: (context, state) {
          log("State is =======$state=====");
          if (state is SuccessStatusState) {
            print("BottomSheetStatusBlocs${state.status}");
           final bottomSheetStatusBloc = context.read<BottomSheetStatusBloc>();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              bottomSheetStatusBloc.switchShowBottomSheet(
                context,
                state.status,
              );
            });
          }

          return Stack(children: [
            Positioned.fill(child: GoogleMapScreen()),
            HomeScreen(),
          ]);
        },
      ),
    );
  }
}
