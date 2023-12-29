import 'package:zaoed/Screens/Finder/screens/home/google_map.dart';
import 'package:zaoed/constants/imports.dart';

class MapHomeScreen extends StatelessWidget {
  const MapHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: Stack(children: [
        Positioned.fill(child: GoogleMapScreen()),
        HomeScreen(),
      ]),
    );
  }
}
