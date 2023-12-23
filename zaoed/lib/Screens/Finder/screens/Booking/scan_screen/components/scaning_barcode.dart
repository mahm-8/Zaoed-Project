import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:zaoed/constants/colors.dart';

class ScaningBarcode extends StatelessWidget {
  const ScaningBarcode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 435,
      width: MediaQuery.of(context).size.width,
      color: AppColors().gray1Trans,
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Text(
            "يتم مسح الباركود",
            style: TextStyle(
                color: AppColors().mainWhite,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 72,
          ),
          Stack(
            children: [
              Image.asset("lib/assets/icons/scaning_QR_barcode.png"),
              Positioned(
                top: 195,
                left: 45,
                child: SizedBox(
                  width: 155,
                  child: Divider(
                    color: AppColors().green,
                    thickness: 5.5,
                  ),
                ),
              )
            ],
          )
          // if scan to start charging completed show ScanCompleteDialog()
          // if scan to end charging and to pay show PayDialog()
          // if barcode is invalid show InvalidBarcodeDialog()
          // if barcode is not found show NotFoundBarcodeDialog()
        ],
      ),
    );
  }
}
