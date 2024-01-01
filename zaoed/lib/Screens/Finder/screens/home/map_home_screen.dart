import 'package:zaoed/Screens/Finder/screens/home/google_map.dart';
import 'package:zaoed/blocs/bottom_sheet_status_bloc/bottom_sheet_status_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class MapHomeScreen extends StatefulWidget {
  const MapHomeScreen({super.key});

  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  late BottomSheetStatusBloc bottomSheetStatusBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      body: BlocBuilder<BottomSheetStatusBloc, BottomSheetStatusState>(
        // buildWhen: (_, newstate) {
        //   if (newstate is SuccessState) {
        //     return false;
        //   }
        //   return false;
        // },
        builder: (context, state) {
          if (state is SuccessState) {
            bottomSheetStatusBloc = BottomSheetStatusBloc();
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
