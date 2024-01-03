import 'package:zaoed/Screens/Finder/screens/home/google_map.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/bottom_sheet_status_bloc/bottom_sheet_status_bloc.dart';
import 'package:zaoed/blocs/finder_bloc/finder_bloc.dart';
import 'package:zaoed/components/sheet_method/arrived_dialog.dart';
import 'package:zaoed/components/sheet_method/car_charging_sheet.dart';
import 'package:zaoed/constants/imports.dart';

class MapHomeScreen extends StatelessWidget {
  MapHomeScreen({super.key});

  final controller = TextEditingController();
  final bottomSheetStatusBloc = BottomSheetStatusBloc();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FinderBloc>();
    context.read<BottomSheetStatusBloc>().add(StatusBottomEvent());
    context.read<ActionsBloc>().add(GetChargingPointsEvent());
    return Scaffold(
      // extendBody: true,
      body: BlocBuilder<BottomSheetStatusBloc, BottomSheetStatusState>(
       
        builder: (context, state) {
          print("%%%%%%%%%%%%%%%5$state%%%%%%%%%%%%%%%%%%%%%%%");
          if (state is SuccessStatusState) {
            print("BottomSheetStatusBlocs${state.status}");
            // final bottomSheetStatusBloc = context.read<BottomSheetStatusBloc>();

            // bottomSheetStatusBloc = BottomSheetStatusBloc();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              bottomSheetStatusBloc.switchShowBottomSheet(
                context,
                state.status,
              );
            });
          }
          //   print(state);
         
          if (state is DestinationState) {
            if (bloc.point != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.arrivedToCharging(chargingPoint: bloc.point);
              });
            }
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
