import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/home/component/button_choice_widget.dart';
import 'package:zaoed/Screens/Finder/screens/home/component/charge_points_card.dart';
import 'package:zaoed/components/sheet_method/car_charging_sheet.dart';
import 'component/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              context.charginfCarSheet();
            },
          ),
          const Spacer(),
          const ChargePointsCard(),
        ],
      ),
    );
  }
}
