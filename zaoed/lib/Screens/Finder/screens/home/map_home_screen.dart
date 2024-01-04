import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
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
        builder: (context, state) {
          if (state is SuccessStatusState) {
            final bottomSheetStatusBloc = context.read<BottomSheetStatusBloc>();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              bottomSheetStatusBloc.switchShowBottomSheet(
                context,
                state.status,
              );
            });
          } else if (state is DestinationState) {
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
