import 'package:zaoed/constants/imports.dart';

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
              textColor: AppColors().gray8,
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
