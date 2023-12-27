import 'package:zaoed/constants/imports.dart';

class TestShowDialogDeleteCharging extends StatelessWidget {
  const TestShowDialogDeleteCharging({super.key});

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
                      title: "حذف نقطة الشحن",
                      bodyText:
                          "سيتم حذف نقطة الشحن المحددة بشكل نهائي، هل أنت موافق؟",
                      button1: 'نعم',
                      button2: 'لا',
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
