import 'package:flutter/material.dart';
import 'package:zaoed/auth/tabbar_login_screen.dart';
import 'package:zaoed/extensions/navigator.dart';

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
                context.pushAndRemoveUntil(view: const TabBarLogin());
              },
              child: const Text("تخطي",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.5,
                  ))),
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
                ),
              )),
        ],
      ),
    );
  }
}
