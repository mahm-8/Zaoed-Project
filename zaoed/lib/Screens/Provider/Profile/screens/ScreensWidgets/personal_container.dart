import 'package:zaoed/Screens/Finder/screens/Profile/widgets/change_pass.dart.dart';
import 'package:zaoed/Screens/Provider/Profile/methods_show_dialog/delete_account.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/personal_information_label.dart';
import 'package:zaoed/constants/imports.dart';

class PersonalContainer extends StatelessWidget {
  PersonalContainer({
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
        Container(
            height: 300,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors().gray6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PersonalInformationLabel(
                  title: 'الأسم',
                  onTap: () {
                    context.push(
                        view: AddInformation(
                            dateController: dateController,
                            nameController: nameController,
                            phoneController: phoneController,
                            selectGender: user?.gender ?? "Select gender"));
                  },
                  subTitle: user?.name ?? "",
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                PersonalInformationLabel(
                  title: 'تاريخ الميلاد',
                  onTap: () {
                    context.push(
                        view: AddInformation(
                            dateController: dateController,
                            nameController: nameController,
                            phoneController: phoneController,
                            selectGender: user?.gender ?? "Select gender"));
                  },
                  subTitle: user?.birthday ?? "",
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                PersonalInformationLabel(
                  title: 'الجنس',
                  onTap: () {
                    context.push(
                        view: AddInformation(
                            dateController: dateController,
                            nameController: nameController,
                            phoneController: phoneController,
                            selectGender: user?.gender ?? "Select gender"));
                  },
                  subTitle: user?.gender ?? "",
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                PersonalInformationLabel(
                  title: 'رقم الجوال',
                  onTap: () {
                    context.push(
                        view: AddInformation(
                            dateController: dateController,
                            nameController: nameController,
                            phoneController: phoneController,
                            selectGender: user?.gender ?? "Select gender"));
                  },
                  subTitle: user?.phone ?? "",
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                PersonalInformationLabel(
                  title: 'البريد الإلكتروني',
                  onTap: () {},
                  subTitle: user?.email ?? "",
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                PersonalInformationLabel(
                  title: "كلمة المرور",
                  onTap: () {
                    context.push(view: ChangePassword());
                  },
                  subTitle: '********',
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                LegalAffairsLable(
                  title: 'حذف الحساب',
                  onTap: () {
                    deleteAccount(context);
                  },
                )
              ],
            )),
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
