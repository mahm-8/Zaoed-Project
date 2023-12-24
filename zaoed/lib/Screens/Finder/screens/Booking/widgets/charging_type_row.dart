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
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageUrl.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
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
