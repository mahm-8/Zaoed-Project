
  import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/show_dialog.dart';

Future<dynamic> AddBankShowDialog(BuildContext context) {
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