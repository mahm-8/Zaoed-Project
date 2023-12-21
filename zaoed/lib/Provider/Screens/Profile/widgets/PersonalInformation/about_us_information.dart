import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/about_us_screen.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/legal_affairs_screen.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/information_lable.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

class AboutUsInformation extends StatelessWidget {
  const AboutUsInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InformationLabel(
          imageIcon: 'lib/assets/icons/About Us.png',
          title: 'من نحن؟',
          onTap: () {
            context.push(view: AboutUsScreen());
          },
        ),
        Divider(
          thickness: 1,
          color: AppColors().gray9,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/Question.png',
          title: 'الأسئلة الشائعة',
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          color: AppColors().gray9,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/Info.png',
          title: 'الشؤون القانونية',
          onTap: () {
            context.push(view: LegalAffairsScreen());
          },
        ),
        Divider(
          thickness: 1,
          color: AppColors().gray9,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/Support.png',
          title: 'الدعم الفني',
          onTap: () {},
        ),
      ]),
    );
  }
}
