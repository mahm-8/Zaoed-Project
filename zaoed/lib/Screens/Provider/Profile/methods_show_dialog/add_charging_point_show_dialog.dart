import 'package:zaoed/constants/imports.dart';

Future<dynamic> AddChargingPointShowDialog(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return const ShowDialog(
        title: "تم إرسال طلب إضافة نقطة شحن جديدة بنجاح",
      );
    },
  );
}
