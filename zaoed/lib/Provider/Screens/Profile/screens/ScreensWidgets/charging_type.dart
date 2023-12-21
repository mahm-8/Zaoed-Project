
import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingType extends StatelessWidget {
  const ChargingType({
    super.key,
    required this.imageUrl,
    required this.count,
    required this.type,
  });
  final String imageUrl;
  final String count;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 76,
          width: 76,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors().gray6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            child: Column(
              children: [
                Image.asset(imageUrl),
                Text(
                  type,
                  style: TextStyle(color: AppColors().white, fontSize: 10),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 24,
          width: 72,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors().gray6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              children: [
                Image.asset('lib/assets/icons/ph_minus.png'),
                const Spacer(),
                Text(count, style: TextStyle(color: AppColors().white)),
                const Spacer(),
                Image.asset('lib/assets/icons/ph_plus.png'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
