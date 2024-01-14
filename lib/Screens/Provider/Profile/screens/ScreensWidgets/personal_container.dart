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
                            selectGender: user?.gender ?? "إختيار الجنس"));
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
                            selectGender: user?.gender ?? "إختيار الجنس"));
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
                            selectGender: user?.gender ?? "إختيار الجنس"));
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
                            selectGender: user?.gender ?? "إختيار الجنس"));
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
