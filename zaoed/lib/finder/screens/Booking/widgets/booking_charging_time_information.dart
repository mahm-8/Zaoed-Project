import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class BookingChargingTimeInformation extends StatelessWidget {
  const BookingChargingTimeInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "مدة الشحن",
          style: TextStyle(fontSize: 19, color: AppColors().white),
        ),
        Text(
          "3 ساعات",
          style: TextStyle(
              fontSize: 16,
              color: AppColors().white,
              fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
