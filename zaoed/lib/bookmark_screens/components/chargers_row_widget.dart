import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ChargersRowWidget extends StatelessWidget {
  const ChargersRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("lib/assets/icons/TeslaDC.png"),
        const SizedBox(
          width: 2,
        ),
        Text(
          "0x",
          style: TextStyle(
              fontSize: 11, fontFamily: "SfArabic", color: AppColors().green),
        ),
        const SizedBox(
          width: 22,
        ),
        Image.asset("lib/assets/icons/TeslaDC.png"),
        const SizedBox(
          width: 2,
        ),
        Text(
          "0x",
          style: TextStyle(
              fontSize: 11, fontFamily: "SfArabic", color: AppColors().green),
        ),
        const SizedBox(
          width: 22,
        ),
        Image.asset("lib/assets/icons/TeslaDC.png"),
        const SizedBox(
          width: 2,
        ),
        Text(
          "0x",
          style: TextStyle(
              fontSize: 11, fontFamily: "SfArabic", color: AppColors().green),
        ),
        const SizedBox(
          width: 22,
        ),
        Image.asset("lib/assets/icons/TeslaDC.png"),
        const SizedBox(
          width: 2,
        ),
        Text("0x",
            style: TextStyle(
                fontSize: 11,
                fontFamily: "SfArabic",
                color: AppColors().green)),
        const SizedBox(
          width: 22,
        ),
      ],
    );
  }
}
