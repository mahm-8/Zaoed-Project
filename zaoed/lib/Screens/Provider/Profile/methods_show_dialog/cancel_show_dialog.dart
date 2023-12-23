import 'package:flutter/material.dart';
import 'package:zaoed/providor_show_dialogs/components/state_dialog.dart';

Future<dynamic> CancelShowDialog(BuildContext context) {
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