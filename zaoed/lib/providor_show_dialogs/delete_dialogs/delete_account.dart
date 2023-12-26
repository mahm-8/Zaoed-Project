import 'package:zaoed/constants/imports.dart';

class TestShowDialogDelete extends StatelessWidget {
  const TestShowDialogDelete({super.key});

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
                      title: "حذف الحساب",
                      bodyText:
                          "سيتم حذف هذا الحساب بشكل نهائي بعد 30 يوم، هل أنت موافق؟",
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
