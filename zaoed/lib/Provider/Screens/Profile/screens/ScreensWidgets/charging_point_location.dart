import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingPointLocation extends StatelessWidget {
  const ChargingPointLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'موقع نقطة الشحن',
            style: TextStyle(color: AppColors().white, fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 283,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors().gray6)),
          ),
        ],
      ),
    );
  }
}
