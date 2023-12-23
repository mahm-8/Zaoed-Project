import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class CarInformation extends StatelessWidget {
  const CarInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'تسلا موديل X',
          style: TextStyle(color: AppColors().white, fontSize: 18),
        ),
        const Spacer(),
        Container(
          width: 80,
          height: 23,
          padding: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: AppColors().green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'جاري الشحن',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
              Image.asset('lib/assets/icons/black_logo.png'),
            ],
          ),
        ),
      ],
    );
  }
}
