import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

import '../components/added_dialog.dart';
import '../components/state_dialog.dart';

class TestShowDialogAddBankDone extends StatelessWidget {
  const TestShowDialogAddBankDone({super.key});

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
                    return const AddedDialog(
                      title: "تم إرسال طلب إضافة نقطة شحن جديدة بنجاح",
                    );

                    // const AddedDialog(
                    //   title: "تم إضافة البيانات البنكية بنجاح",
                    // );
                  },
                );
                Future.delayed(const Duration(seconds: 5), () {
                  Navigator.of(context).pop();
                });
              },
              child: const Text("test"),
            ),
          ],
        ),
      ),
    );
  }
}
