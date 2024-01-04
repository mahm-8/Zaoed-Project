import 'package:zaoed/Screens/Finder/screens/home/google_map.dart';
import 'package:zaoed/constants/imports.dart';

class MapHomeScreen extends StatelessWidget {
  MapHomeScreen({super.key});

  final controller = TextEditingController();
  final bottomSheetStatusBloc = BottomSheetStatusBloc();
  @override
  Widget build(BuildContext context) {
    context.read<ActionsBloc>().add(GetChargingPointsEvent());
    final bloc = context.read<FinderBloc>();
    context.read<BottomSheetStatusBloc>().add(StatusBottomEvent());
    context.read<BottomSheetStatusBloc>().add(StatusEvent());
    return Scaffold(
      resizeToAvoidBottomInset: false,

      // extendBody: true,
      body: BlocBuilder<BottomSheetStatusBloc, BottomSheetStatusState>(
        // buildWhen: (previous, current) {
        //   if (current is SuccessStatusState) {
        //     return true;
        //   } else if (current is DestinationState) {
        //     return true;
        //   }
        //   return false;
        // },
        builder: (context, state) {
          print("=========State is =======$state");

          if (state is SuccessStatusState) {
            print("${state.status}========1========");
            final bottomSheetStatusBloc = context.read<BottomSheetStatusBloc>();
            print("${state.status}========2========");
            WidgetsBinding.instance.addPostFrameCallback((_) {
              print("${state.status}========3=======");
              bottomSheetStatusBloc.switchShowBottomSheet(
                context,
                state.status,
              );
              print("${state.status}========4========");
            });
          }
          //   print(state);

          else if (state is DestinationState) {
            print("===========================5555================");
            if (bloc.point != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.arrivedToCharging(chargingPoint: bloc.point);
              });
            }
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
