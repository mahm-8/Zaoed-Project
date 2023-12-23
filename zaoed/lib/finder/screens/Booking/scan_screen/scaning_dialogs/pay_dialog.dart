import 'package:flutter/material.dart';
import '../../../../../components/dialog_widgets/one_button_dialog_widget.dart.dart';

class PayDialog extends StatelessWidget {
  const PayDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWidgetOneButton(
      title: "تم استلام المركبة",
      bodyText: "نشكر لكم الاستعانة بخدماتنا ونرجو أن تكون قد حازت على رضاكم",
      button1: "الدفع",
      pressOne: () {
        // pay screen
      },
    );
  }
}
