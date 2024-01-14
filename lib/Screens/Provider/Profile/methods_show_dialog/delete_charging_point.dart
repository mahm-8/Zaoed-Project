import 'package:zaoed/constants/imports.dart';

Future<dynamic> DeleteChargingPoint(BuildContext context, int? pointID) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return DialogWidget(
        title: "حذف نقطة الشحن",
        bodyText: "سيتم حذف نقطة الشحن المحددة بشكل نهائي، هل أنت موافق؟",
        button1: 'نعم',
        button2: 'لا',
        pressOne: () {
          context
              .read<ProviderBloc>()
              .add(DeleteChargingPointEvent(pointId: pointID));
          context.pop();
          showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const StateDialog(
                title: "تمت عملية الحذف بنجاح",
              );
            },
          );
          Future.delayed(const Duration(seconds: 3), () {
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
                title: "تم الإلغاء",
              );
            },
          );
        },
      );
    },
  );
}
