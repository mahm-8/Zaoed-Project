import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Provider/Profile/methods_show_dialog/log_out_show_dailog.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/personal_container.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/personal_image_container.dart';
import 'package:zaoed/blocs/auth_bloc/auth_bloc.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/model/user_model.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key, this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'البيانات الشخصية'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
        child: Column(
          children: [
            const PersonalImageContainer(),
            PersonalContainer(
              user: user,
            ),
            const Spacer(),
            ButtonWidget(
              textEntry: 'تسجيل الخروج',
              backColor: AppColors().green,
              textColor: AppColors().white,
              onPress: () {
                logOutShowDailog(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
