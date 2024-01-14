import 'package:zaoed/constants/imports.dart';

Future<dynamic> addBankShowDialog(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return const ShowDialog(
        title: "تم إضافة البيانات البنكية بنجاح",
      );
    },
  );
}
