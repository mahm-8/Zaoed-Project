import 'package:flutter/material.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

extension ChargingCarSheet on BuildContext {
  charginfCarSheet() {
    showBottomSheet(
      enableDrag: true,
      context: this,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
              color: AppColors().gray6),
          height: context.getHeight(divide: 3),
          width: context.getWidth(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Text("يتم شحن مركبتك",
                        style:
                            TextStyle(color: AppColors().white, fontSize: 24)),
                    SizedBox(width: 8),
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: AppColors().gray5,
                        color: AppColors().green,
                        strokeAlign:
                            CircularProgressIndicator.strokeAlignCenter,
                        strokeWidth: 2,
                        strokeCap: StrokeCap.round,
                      )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    "يمكنك معرفة تفاصيل أكثر من خلال \nالذهاب إلى خانة معلومات المركبة",
                    style: TextStyle(color: AppColors().white, fontSize: 20)),
                const SizedBox(height: 25),
                ButtonWidget(
                  onPress: () {},
                  textEntry: "متابعة عملية الشحن",
                  backColor: AppColors().green,
                  textColor: AppColors().gray6,
                  borderColor: AppColors().green,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
