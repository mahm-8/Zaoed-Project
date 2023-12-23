
  import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/show_dialog.dart';

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