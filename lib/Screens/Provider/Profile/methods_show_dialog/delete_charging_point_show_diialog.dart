import 'package:zaoed/constants/imports.dart';

Future<dynamic> deleteChargingPointShowDialog(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return DialogWidget(
        title: "حذف نقطة الشحن",
        imageIcon: ImageIcon(
          const AssetImage('lib/assets/icons/mingcute_sad-fill.png'),
          color: AppColors().green,
        ),
        bodyText: 'سيتم حذف جميع البيانات التي تم ادخالها، هل أنت متأكد؟',
        button1: 'نعم',
        button2: 'التراجع',
        pressOne: () {
          cancelShowDialog(context);
          Future.delayed(const Duration(seconds: 2), () {
            context.pop();
          });
        },
        pressTwo: () {
          context.pop();
          showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const StateDialog(
                title: "تم التراجع",
              );
            },
          );
        },
      );
    },
  );
}
