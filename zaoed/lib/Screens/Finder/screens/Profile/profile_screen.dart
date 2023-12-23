import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/AppBar/information_app_bar.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/PersonalInformation/about_us_information.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/PersonalInformation/finder_info_widget.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/PersonalInformation/payment_information.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/PersonalInformation/setting_widget.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/information_title.dart';
import 'package:zaoed/Screens/Provider/Profile/widgets/PersonalInformation/social_media_information.dart';
import 'package:zaoed/constants/colors.dart';

class ProfileFinder extends StatelessWidget {
  const ProfileFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profailAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: const [
              TitleInfoWidget(
                title: 'بياناتي',
              ),
              FinderInfoWidget(),
              TitleInfoWidget(
                title: 'عام',
              ),
              SettingWidget(),
              TitleInfoWidget(
                title: 'الدفع',
              ),
              PaymentFinder(),
              TitleInfoWidget(
                title: 'عن تطبيق زوّد',
              ),
              AboutUsInfoWidget(),
              SizedBox(
                height: 32,
              ),
              SocialMediaInformation()
            ],
          ),
        ),
      ),
    );
  }
}
