import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                "التحقق من البريد الإلكتروني",
                style: TextStyle(
                    fontSize: 25,
                    color: AppColors().white,
                    fontFamily: "SfArabic"),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "ادخل رمز التحقق المرسل للبريد الإلكتروني:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    color: AppColors().white,
                    fontFamily: "SfArabic"),
              ),
              Text(
                email,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    color: AppColors().white,
                    fontFamily: "SfArabic"),
              ),
              const SizedBox(
                height: 50,
              ),
              Pinput(
                autofocus: true,
                length: 6,
                defaultPinTheme: PinTheme(
                    width: 48,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: AppColors().green, width: 0.4),
                            top: BorderSide(
                                color: AppColors().green, width: 0.4)),
                        color: AppColors().gray1Trans,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)))),
                onCompleted: (pin) {
                  ///
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
