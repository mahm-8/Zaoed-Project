import 'package:zaoed/Screens/Finder/screens/Profile/widgets/PersonalInformation/info_user.dart';
import 'package:zaoed/constants/imports.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    print("1");
    return Scaffold(
        floatingActionButton: BlocListener<AuthBloc, AuthStates>(
          listener: (context, state) {
            if (state is LogoutSuccessState) {
              context.pushAndRemoveUntil(view: const TabBarLogin());
            } else if (state is ErrorLogoutState) {
              Navigator.of(context).pop();
              context.showErrorMessage(msg: state.msg);
            }
          },
          child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(LogoutEvent());
                context.showLoading();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  foregroundColor: AppColors().gray8,
                  minimumSize: Size(context.getWidth(divide: 1.1), 40),
                  backgroundColor: AppColors().green),
              child: const Text(
                "تسجيل الخروج",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),
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
