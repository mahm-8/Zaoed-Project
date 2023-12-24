import 'package:zaoed/constants/imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
            ),
            SearchFieldWidget(),
            const SizedBox(
              height: 16,
            ),
            ButtonChoiceWidget(
              imageUrl: "lib/assets/icons/map_layer.png",
              onPress: () {
                // change map type
                // show trafic
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonChoiceWidget(
              imageUrl: "lib/assets/icons/main_info.png",
              onPress: () {
                context.arrivedToCharging();
              },
            ),
            const Spacer(),
            const ChargePointsCard(),
          ],
        ),
      ),
    );
  }
}
