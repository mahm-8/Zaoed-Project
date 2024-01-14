// ignore_for_file: use_build_context_synchronously

import 'package:zaoed/constants/imports.dart';

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
                          selectGender: user?.gender ?? "إختيار الجنس"))),
              Divider(color: AppColors().black),
              EditProfile(
                title: 'تاريخ الميلاد',
                value: user?.birthday ?? "",
                onPressed: () => context.push(
                    view: AddInformation(
                        dateController: dateController,
                        nameController: nameController,
                        phoneController: phoneController,
                        selectGender: user?.gender ?? "إختيار الجنس")),
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
                          selectGender: user?.gender ?? "إختيار الجنس"))),
              Divider(color: AppColors().black),
              EditProfile(
                  title: 'رقم الجوال',
                  value: user?.phone ?? "",
                  onPressed: () => context.push(
                      view: AddInformation(
                          dateController: dateController,
                          nameController: nameController,
                          phoneController: phoneController,
                          selectGender: user?.gender ?? "إختيار الجنس"))),
              Divider(color: AppColors().black),
              EditProfile(
                  title: 'البريد',
                  value: user?.email ?? "",
                  onPressed: () => context.push(view: ChangePassword())),
              Divider(color: AppColors().black),
              EditProfile(
                  title: 'كلمة المرور',
                  onPressed: () => context.push(view: ChangePassword()),
                  value: '********'),
              Divider(color: AppColors().black),
              EditProfile(
                  onPressed: () {
                    deleteAccount(context);
                  },
                  title: 'حذف الحساب',
                  icon: Icons.keyboard_arrow_left),
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
