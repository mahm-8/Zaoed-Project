import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/customer_service_chat/chat_screen.dart';
import 'package:zaoed/components/dialog_widgets/dialog_widget.dart';

class NotFoundBarcodeDialog extends StatelessWidget {
  const NotFoundBarcodeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWidget(
      title: "خطأ!",
      bodyText: "لم يتم إيجاد الباركود",
      button1: "إعادة المحاولة",
      pressOne: () {
        Navigator.pop(context);
      },
      button2: "الدعم",
      pressTwo: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => ChatScreen())));
      },
    );
  }
}
