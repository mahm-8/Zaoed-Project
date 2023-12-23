import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/widgets/charging_type_container.dart';

class ChargingTypeRow extends StatefulWidget {
  const ChargingTypeRow({super.key});

  @override
  State<ChargingTypeRow> createState() => _ChargingTypeRowState();
}

class _ChargingTypeRowState extends State<ChargingTypeRow> {
  int selectedIndex = -1;

  List<String> imageUrl = [
    'lib/assets/icons/GB.png',
    'lib/assets/icons/Type 2.png',
    'lib/assets/icons/Tesla.png',
    'lib/assets/icons/Type 1.png',
  ];

  List<String> types = [
    'GB/T AC',
    'Type2',
    'Tesla',
    'Type1',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: List.generate(
          imageUrl.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: index == 0 ? 0 : 15),
              child: ChargingTypeContainer(
                imageUrl: imageUrl[index],
                type: types[index],
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
