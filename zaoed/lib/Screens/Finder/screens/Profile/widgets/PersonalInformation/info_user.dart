// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/screens/ScreensWidgets/edit_profile.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/PersonalInformation/image_widget.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/add_profile.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/change_pass.dart.dart';
import 'package:zaoed/Screens/Provider/Profile/methods_show_dialog/delete_account.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_bloc.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';
import 'package:zaoed/model/user_model.dart';

class InfoUser extends StatelessWidget {
  InfoUser({
    super.key,
    required this.user,
  });
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    controllerText(context);
    return Column(
      children: [
        SizedBox(
          height: context.getHeight(divide: 8),
          width: context.getWidth(divide: 4),
          child: ImageWidget(user: user),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors().gray6),
          child: Column(
            children: [
              EditProfile(
                  title: 'الاسم :',
                  value: user?.name ?? "",
                  onPressed: () => context.push(
                      view: AddInformation(
                          dateController: dateController,
                          nameController: nameController,
                          phoneController: phoneController,
                          selectGender: user?.gender ?? "Select gender"))),
              Divider(color: AppColors().black),
              EditProfile(
                title: 'تاريخ الميلاد',
                value: user?.birthday ?? "",
                onPressed: () => context.push(
                    view: AddInformation(
                        dateController: dateController,
                        nameController: nameController,
                        phoneController: phoneController,
                        selectGender: user?.gender ?? "Select gender")),
              ),
              Divider(color: AppColors().black),
              EditProfile(
                  title: 'الجنس',
                  value: user?.gender ?? "",
                  onPressed: () => context.push(
                      view: AddInformation(
                          dateController: dateController,
                          nameController: nameController,
                          phoneController: phoneController,
                          selectGender: user?.gender ?? "Select gender"))),
              Divider(color: AppColors().black),
              EditProfile(
                  title: 'رقم الجوال',
                  value: user?.phone ?? "",
                  onPressed: () => context.push(
                      view: AddInformation(
                          dateController: dateController,
                          nameController: nameController,
                          phoneController: phoneController,
                          selectGender: user?.gender ?? "Select gender"))),
              Divider(color: AppColors().black),
              EditProfile(
                  title: 'البريد',
                  value: user?.email ?? "",
                  onPressed: () => context.push(view: ChangePassword())),
              Divider(color: AppColors().black),
               EditProfile(title: 'كلمة المرور',onPressed: () => context.push(view: ChangePassword()), value: '********'),
              Divider(color: AppColors().black),
               EditProfile(onPressed: (){deleteAccount(context);},
                  title: 'حذف الحساب', icon: Icons.keyboard_arrow_left),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        )
      ],
    );
  }

  controllerText(BuildContext context) {
    final user = context.read<UserBloc>();
    dateController.text = user.user?.birthday ?? "";
    nameController.text = user.user?.name ?? "";
    phoneController.text = user.user?.phone ?? "";
  }
}
