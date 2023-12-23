import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class BookingChargingInformation extends StatelessWidget {
  const BookingChargingInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "المنفذ",
            style: TextStyle(fontSize: 19, color: AppColors().white),
          ),
          Row(
            children: [
              Image.asset(
                'lib/assets/icons/Type 2.png',
                width: 21,
                height: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Type 2',
                style: TextStyle(
                    color: AppColors().white, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ],
      ),
    );
  }
}
