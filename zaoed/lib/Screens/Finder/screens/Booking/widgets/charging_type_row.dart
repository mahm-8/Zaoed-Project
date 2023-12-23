import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/widgets/charging_type_container.dart';

class ChargingTypeRow extends StatelessWidget {
  const ChargingTypeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ChargingTypeContainer(
            imageUrl: 'lib/assets/icons/GB.png',
            type: 'GB/T AC',
          ),
          SizedBox(
            width: 15,
          ),
          ChargingTypeContainer(
            imageUrl: 'lib/assets/icons/Type 2.png',
            type: 'Type2',
          ),
          SizedBox(
            width: 15,
          ),
          ChargingTypeContainer(
            imageUrl: 'lib/assets/icons/Tesla.png',
            type: 'Tesla',
          ),
          SizedBox(
            width: 15,
          ),
          ChargingTypeContainer(
            imageUrl: 'lib/assets/icons/Type 1.png',
            type: 'Type1',
          ),
        ],
      ),
    );
  }
}
