import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Provider/Profile/methods_show_dialog/cancel_show_dialog.dart';
import 'package:zaoed/components/dialog_widgets/dialog_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

Future<dynamic> DeleteChargingPointShowDialog(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return DialogWidget(
        title: "حذف نقطة الشحن",
        imageIcon: ImageIcon(
          AssetImage('lib/assets/icons/mingcute_sad-fill.png'),
          color: AppColors().green,
        ),
        bodyText: 'سيتم حذف جميع البيانات التي تم ادخالها، هل أنت متأكد؟',
        button1: 'نعم',
        button2: 'التراجع',
        pressOne: () {
          CancelShowDialog(context);
          Future.delayed(const Duration(seconds: 2), () {
            context.pop();
            context.pop();
          });
        },
        pressTwo: () {
          context.pop();
        },
      );
    },
  );
}