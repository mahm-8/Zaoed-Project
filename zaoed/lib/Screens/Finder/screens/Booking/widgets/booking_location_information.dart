import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class BookingLocationInformation extends StatelessWidget {
  const BookingLocationInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الموقع",
          style: TextStyle(fontSize: 19, color: AppColors().white),
        ),
        Text(
          'منزل إيلاف محمد',
          style: TextStyle(fontSize: 17, color: AppColors().white),
        ),
        Text(
          'حي النرجس، الرياض 1234',
          style: TextStyle(
              color: AppColors().white,
              fontSize: 12,
              fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
