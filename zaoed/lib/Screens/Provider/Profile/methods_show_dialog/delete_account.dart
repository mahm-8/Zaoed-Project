import 'package:zaoed/constants/imports.dart';

Future<dynamic> deleteAccount(BuildContext context) {
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
