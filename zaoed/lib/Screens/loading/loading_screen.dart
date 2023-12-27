
import 'package:zaoed/constants/imports.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthStates>(
      buildWhen: (oldState, newState) {
        if (newState is CheckLoginState) {
          Future.delayed(const Duration(seconds: 4), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => NavigationBarScreen()),
                (route) => false);
          });
        } else if (newState is ErrorCheckState) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => TabBarLogin()),
              (route) => false);
        }
        return false;
      },
      builder: (context, state) {
        return  Scaffold(
          backgroundColor: AppColors().gray9,
          body: Center(
            child: Image.asset("lib/assets/images/ZaoedLogo.png"),
          ),
        );
      },
    );
  }
}
