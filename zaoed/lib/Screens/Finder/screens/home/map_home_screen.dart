import 'package:zaoed/Screens/Finder/screens/home/google_map.dart';
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
        blocTest.emit(BottomSheetStatusInitial());
      });
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<BottomSheetStatusBloc, BottomSheetStatusState>(
        builder: (context, state) {
          return Stack(children: [
            const Positioned.fill(child: GoogleMapScreen()),
            HomeScreen(),
          ]);
        },
      ),
    );
  }
}
