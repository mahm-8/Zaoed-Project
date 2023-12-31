import 'package:zaoed/constants/imports.dart';

class InvalidBarcodeDialog extends StatelessWidget {
  const InvalidBarcodeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      title: "خطأ!",
      bodyText: "هذا الباركود غير صالح",
      button1: "إعادة المحاولة",
      pressOne: () {
        context.pop();

        // call camera event again
      },
      button2: "الدعم",
      pressTwo: () {
        context.push(view: ChatScreen());
      },
    );
  }
}
