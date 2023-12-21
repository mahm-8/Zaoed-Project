import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/settings_screen.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/information_lable.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

class PublicSittings extends StatelessWidget {
  const PublicSittings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InformationLabel(
          imageIcon: 'lib/assets/icons/Settings.png',
          title: 'الإعدادات',
          onTap: () {
            context.push(view: SettingsScreen());
          },
        ),
        Divider(
          thickness: 1,
          color: AppColors().gray9,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/sign.png',
          title: 'المحفوظات',
          onTap: () {},
        ),
      ]),
    );
  }
}
