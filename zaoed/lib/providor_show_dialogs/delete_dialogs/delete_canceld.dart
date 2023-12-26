import 'package:zaoed/constants/imports.dart';

class TestShowDialogDeleteCancel extends StatelessWidget {
  const TestShowDialogDeleteCancel({super.key});

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
                      title: "تم الإلغاء",
                    );
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
