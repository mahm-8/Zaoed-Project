
import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class BookingPriceLabel extends StatelessWidget {
  BookingPriceLabel(
      {super.key,
      required this.title,
      required this.subTitle,
      this.isDiscount = false});
  final String title;
  final String subTitle;
  late bool isDiscount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: AppColors().white, fontSize: 18),
          ),
          Spacer(),
          Text(subTitle,
              style: TextStyle(
                  color: isDiscount ? AppColors().red : AppColors().white,
                  fontSize: 13))
        ],
      ),
    );
  }
}