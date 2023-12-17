import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

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
                    return AddedDialog(
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

class AddedDialog extends StatelessWidget {
  const AddedDialog({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: OutlineInputBorder(borderSide: BorderSide.none),
      alignment: Alignment.bottomCenter,
      backgroundColor: AppColors().gray6,
      insetAnimationDuration: const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 0.3, color: AppColors().green),
              left: BorderSide(width: 0.3, color: AppColors().green)),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                fontFamily: "SfArabic",
                color: AppColors().mainWhite),
          ),
        ),
      ),
    );
  }
}
