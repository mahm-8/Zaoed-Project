import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ScanBarcode extends StatelessWidget {
  const ScanBarcode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "امسح الباركود",
            style: TextStyle(
                color: AppColors().mainWhite,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 72,
          ),
          Image.asset("lib/assets/icons/QR_Code_Square.png")
        ],
      ),
    );
  }
}
