import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'components/dialog_widget.dart';

class TestShowDialogLogout extends StatelessWidget {
  const TestShowDialogLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return DialogWidget(
                      imageIcon: ImageIcon(
                        const AssetImage("lib/assets/icons/Info.png"),
                        color: AppColors().green,
                      ),
                      title: "تنبية!",
                      bodyText:
                          "سيتم حذف جميع البيانات التي تم إدخالها، هل أنت متأكد",
                      button1: 'نعم',
                      button2: 'التراجع',
                    );
                  },
                );
              },
              child: const Text("test"),
            ),
          ],
        ),
      ),
    );
  }
}
