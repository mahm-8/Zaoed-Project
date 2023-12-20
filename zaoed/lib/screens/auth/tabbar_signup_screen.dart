import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/screens/auth/components/language_widget.dart';
import 'package:zaoed/screens/auth/components/tab_bar_widget.dart';
import 'package:zaoed/screens/auth/signup_screen.dart';

class TabbarSignup extends StatelessWidget {
  const TabbarSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors().gray9,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 55,
                ),
                const LanguageWidget(),
                Image.asset('lib/assets/images/faded_logo.png'),
                const SizedBox(
                  height: 50,
                ),
                const TabBarWidget(),
                Expanded(
                  child: TabBarView(children: [
                    SignUpScreen(),
                    SignUpScreen(),
                  ]),
                ),
              ],
            ),
          )),
    );
  }
}
