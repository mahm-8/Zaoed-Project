import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class MapHomeScreen extends StatelessWidget {
  MapHomeScreen({super.key});
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<ActionsBloc>().add(GetChargingPointsEvent());
    context.read<BottomSheetStatusBloc>().add(StatusBottomEvent());
    final blocTest = context.read<BottomSheetStatusBloc>();
    if (blocTest.state is TestState) {
      Future.delayed(Duration(seconds: 6), () {
        blocTest.switchShowBottomSheet(context, blocTest.statusUsed!);
        // ignore: invalid_use_of_visible_for_testing_member
        blocTest.emit(BottomSheetStatusInitial());
      });
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:
            Stack(children: [
          const Positioned.fill(child: GoogleMapScreen()),
          HomeScreen(),
        ])
      
        );
  }
}