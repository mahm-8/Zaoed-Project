import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/components/dialog_widgets/dialog_widget.dart';

class TestShowDialogChangeLanguage extends StatelessWidget {
  const TestShowDialogChangeLanguage({super.key});

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
                    return const DialogWidget(
                        title: "تغيير اللغة",
                        bodyText:
                            "سيتم تغيير اللغة من العربية للإنجليزية، هل أنت موافق؟",
                        button1: "نعم",
                        button2: "لا");
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
