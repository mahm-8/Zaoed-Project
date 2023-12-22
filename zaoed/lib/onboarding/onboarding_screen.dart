import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/auth/tabbar_login_screen.dart';

import '../components/button_widget.dart';
import 'components/map_background.dart';
import 'components/onboarding_row.dart';
import 'onboarding_pages/page1.dart';
import 'onboarding_pages/page2.dart';

class OnboradingScreen extends StatefulWidget {
  const OnboradingScreen({super.key});

  @override
  State<OnboradingScreen> createState() => _OnboradingScreenState();
}

late PageController controller;
int pageIndex = 0;

class _OnboradingScreenState extends State<OnboradingScreen> {
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().gray9,
        body: Stack(children: [
          const MapBackground(),
          Positioned(
            child: SizedBox(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    // add bloc here
                    pageIndex = value;
                  });
                },
                children: const [
                  Page1(),
                  Page2(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 165,
            child: SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: ExpandingDotsEffect(
                  activeDotColor: AppColors().green,
                  dotHeight: 3,
                  strokeWidth: 0.5,
                  dotColor: AppColors().gray4),
            ),
          )
        ]),
        bottomNavigationBar: pageIndex == 0
            ? OnboardingRow(
                pageController: controller,
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: ButtonWidget(
                  backColor: AppColors().green,
                  textEntry: 'ابدأ',
                  onPress: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const TabBarLogin())),
                        (route) => false);
                  },
                  textColor: AppColors().gray8,
                ),
              ));
  }
}
