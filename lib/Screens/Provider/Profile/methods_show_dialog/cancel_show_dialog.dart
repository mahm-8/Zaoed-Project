import 'package:zaoed/constants/imports.dart';

Future<dynamic> cancelShowDialog(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return const StateDialog(
        title: "تم الإلغاء",
      );
    },
  );
}
