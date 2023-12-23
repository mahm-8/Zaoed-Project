import 'package:flutter/material.dart';
import 'package:zaoed/components/dialog_widgets/dialog_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/providor_show_dialogs/components/state_dialog.dart';

import 'package:zaoed/Screens/onboarding/onboarding_screen.dart';

Future<dynamic> DeleteAccount(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return DialogWidget(
        title: "حذف الحساب",
        bodyText: "سيتم حذف هذا الحساب بشكل نهائي بعد 30 يوم، هل أنت موافق؟",
        button1: 'نعم',
        button2: 'لا',
        pressOne: () {
          showDialog(
            barrierColor: AppColors().gray9,
            context: context,
            builder: (context) {
              return const StateDialog(
                title: 'تم حذف حسابك بنجاح',
                isScreen: true,
              );
            },
          );
          Future.delayed(const Duration(seconds: 2), () {
            context.pop();
            context.pushAndRemoveUntil(view: OnboradingScreen());
          });
        },
        pressTwo: () {
          context.pop();
        },
      );
    },
  );
}
