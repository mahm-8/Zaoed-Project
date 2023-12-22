import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/charging_type.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingTypeSection extends StatelessWidget {
  const ChargingTypeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع وعدد منافذ الشحن',
          style: TextStyle(color: AppColors().white, fontSize: 20),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              ChargingType(
                imageUrl: 'lib/assets/icons/GB.png',
                count: '2',
                type: 'GB/T AC',
              ),
              SizedBox(
                width: 15,
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/Type 2.png',
                count: '2',
                type: 'Type2',
              ),
              SizedBox(
                width: 15,
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/Tesla.png',
                count: '2',
                type: 'Tesla',
              ),
              SizedBox(
                width: 15,
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/Type 1.png',
                count: '2',
                type: 'Type1',
              )
            ],
          ),
        )
      ],
    );
  }
}
