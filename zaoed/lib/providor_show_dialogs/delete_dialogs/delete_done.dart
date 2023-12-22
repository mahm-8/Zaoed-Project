import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

import '../components/state_dialog.dart';

class TestShowDialogDeleteDone extends StatelessWidget {
  const TestShowDialogDeleteDone({super.key});

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
                    return const StateDialog(
                      title: "تمت عملية الحذف بنجاح",
                    );
                  },
                );
                Future.delayed(const Duration(seconds: 3), () {
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
