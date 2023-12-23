import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class BookingDataContainer extends StatelessWidget {
  BookingDataContainer({
    super.key,
  });

  late int hours = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 85,
      decoration: BoxDecoration(
          color: AppColors().gray6, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(children: [
          Container(
            height: 57,
            width: 57,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors().white,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/icons/Type 1.png',
                  width: 29,
                  height: 29,
                ),
                Text(
                  'CCS 2',
                  style: TextStyle(color: AppColors().white, fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'منفذ تيسلا الإلكتروني',
                style: TextStyle(color: AppColors().white, fontSize: 16),
              ),
              Text(
                'مدة الحجز: $hours ساعات',
                style: TextStyle(color: AppColors().white, fontSize: 16),
              )
            ],
          )
        ]),
      ),
    );
  }
}
