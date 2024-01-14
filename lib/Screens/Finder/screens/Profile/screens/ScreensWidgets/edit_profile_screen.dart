import 'package:zaoed/constants/imports.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ButtonWidget(
            textEntry: "تسجيل الخروج",
            onPress: () {
              logOutShowDailog(context);
            },
            backColor: AppColors().green,
            textColor: AppColors().gray8),
        appBar: appBar(context, title: 'البيانات الشخصية'),
        backgroundColor: AppColors().gray9,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: [InfoUser(user: user)]),
          ),
        ));
  }
}
