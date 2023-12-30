import 'package:zaoed/constants/imports.dart';

Future<dynamic> editchargingscreenShowDialog(
    BuildContext context, Function()? onpress) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return DialogWidget(
        title: "تعديل نقطة الشحن",
        imageIcon: ImageIcon(
          const AssetImage('lib/assets/icons/mingcute_sad-fill.png'),
          color: AppColors().green,
        ),
        bodyText: 'سيتم تعديل البيانات التي تم ادخالها، هل أنت متأكد؟',
        button1: 'نعم',
        button2: 'التراجع',
        pressOne: onpress,
        pressTwo: () {
          context.pop();
        },
      );
    },
  );
}
