import 'package:zaoed/constants/imports.dart';

Future<dynamic> logOutShowDailog(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return DialogWidget(
        title: 'تسجيل الخروج',
        bodyText: 'سيتم تسجيل خروجك من الحساب، هل أنت موافق؟',
        button1: 'نعم',
        button2: 'لا',
        pressOne: () {
          context.read<AuthBloc>().add(LogoutEvent());

          showDialog(
            barrierColor: AppColors().gray9,
            context: context,
            builder: (context) {
              return const StateDialog(
                title: 'تم تسجيل خروجك  بنجاح',
                isScreen: true,
              );
            },
          );
          Future.delayed(const Duration(seconds: 2), () {
            context.pushAndRemoveUntil(view: OnboradingScreen());
          });
        },
        pressTwo: () {
          context.pop();
          showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const StateDialog(
                title: "تم التراجع",
              );
            },
          );
        },
      );
    },
  );
}
