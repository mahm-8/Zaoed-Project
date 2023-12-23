import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/providor_show_dialogs/components/dialog_button.dart';


class ScanCompleteDialog extends StatelessWidget {
  const ScanCompleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: key,
      alignment: Alignment.bottomCenter,
      backgroundColor: AppColors().gray6,
      insetAnimationDuration: const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: 220,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تم التحقق بنجاح",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "تمت عملية مسح الباركود بنجاح، نشكركم على الإستعانة بخدماتنا ونتمنى لكم رحلة آمنة",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 32,
              ),
              DialogButton(
                textEntry: "التالي",
                
                backColor: AppColors().green,
                textColor: AppColors().gray6,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
