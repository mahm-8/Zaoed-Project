import 'package:flutter/material.dart';
import 'package:zaoed/components/dialog_widgets/one_button_dialog_widget.dart.dart';


class ScanCompleteDialog extends StatelessWidget {
  const ScanCompleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWidgetOneButton(
      title: "تم التحقق بنجاح",
      bodyText:
          "تمت عملية مسح الباركود بنجاح، نشكركم على الإستعانة بخدماتنا ونتمنى لكم رحلة آمنة",
      button1: "التالي",
      pressOne: () {
        // pay screen
      },
    );
  }
}
