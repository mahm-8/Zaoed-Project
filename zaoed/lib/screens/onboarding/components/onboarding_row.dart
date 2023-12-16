import 'package:flutter/material.dart';
import 'package:zaoed/screens/auth/components/tab_bar_widget.dart';

class OnboardingRow extends StatelessWidget {
  const OnboardingRow({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => TabBarWidget()),
                    (route) => false);
              },
              child: const Text("تخطي",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                      fontFamily: "SfArabic"))),
          TextButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              child: const Text(
                "التالي",
                style: TextStyle(
                    color: Color(0xff3FEDB2),
                    fontSize: 14.5,
                    fontFamily: "SfArabic"),
              )),
        ],
      ),
    );
  }
}
