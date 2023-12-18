import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/finder/Profile/screens/about_us_screen.dart';
import 'package:zaoed/finder/Profile/screens/legal_affairs_screen.dart';
import 'package:zaoed/finder/Profile/widgets/information_lable.dart';

class AboutUsInfoWidget extends StatelessWidget {
  const AboutUsInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/About Us.png',
          title: 'من نحن؟',
          onTap: () {
            context.push(view: const AboutUsScreen());
          },
        ),
        Divider(
          thickness: 1,
          color: AppColors().black,
        ),
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/Question.png',
          title: 'الأسئلة الشائعة',
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          color: AppColors().black,
        ),
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/Info.png',
          title: 'الشؤون القانونية',
          onTap: () {
            context.push(view: const LegalAffairsScreen());
          },
        ),
        Divider(
          thickness: 1,
          color: AppColors().black,
        ),
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/Support.png',
          title: 'الدعم الفني',
          onTap: () {},
        ),
      ]),
    );
  }
}
