import 'package:zaoed/constants/imports.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.type});
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final emailController = TextEditingController(),
      passwordController = TextEditingController();
  bool pass = false;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors().gray9,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            TextfieldWidget(
              keyForm: _emailKey,
              keyboardType: TextInputType.emailAddress,
              hint: 'ادخل البريد الإلكتروني',
              controller: emailController,
              obscure: false,
              displayPass: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return "ادخل البريد الإلكتروني";
                }
                if (!value.isValidEmail) {
                  return "البريد الإلكتروني يجب أن يحتوي الايميل على (@) و (.)";
                }
                return null;
              },
            ),
            BlocBuilder<AuthBloc, AuthStates>(
              builder: (context, state) {
                if (state is DisplayState) {
                  return TextfieldWidget(
                      keyForm: _passwordKey,
                      keyboardType: TextInputType.emailAddress,
                      hint: 'ادخل كلمة السر',
                      controller: passwordController,
                      obscure: true,
                      displayPass: state.display,
                      onTap: () => context
                          .read<AuthBloc>()
                          .add(DisplayPasswordEvent(state.display)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ادخل كلمة السر";
                        }
                        if (!value.isValidPassword) {
                          return "كلمة السر يجب ان تحتوي على رقم ورمز وحرف كبير و صغير";
                        }
                        return null;
                      });
                }
                return TextfieldWidget(
                  keyForm: _passwordKey,
                  keyboardType: TextInputType.emailAddress,
                  hint: 'ادخل كلمة السر',
                  controller: passwordController,
                  obscure: true,
                  displayPass: pass,
                  onTap: () =>
                      context.read<AuthBloc>().add(DisplayPasswordEvent(pass)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "ادخل كلمة السر";
                    }
                    if (!value.isValidPassword) {
                      return "كلمة السر يجب ان تحتوي على رقم ورمز وحرف كبير و صغير";
                    }
                    return null;
                  },
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {
                context.push(view: const TabbarSignup());
              },
              child: Text(
                "ليس لديك حساب؟ إنشاء حساب",
                style: const TextStyle().appBarAction,
              ),
            ),
            BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
              if (state is SuccessLoginState) {
                context.read<AuthBloc>().add(CheckLoginEvent());
                context.pushAndRemoveUntil(view: const LoadingScreen());
              }
              if (state is ErrorLoginState) {
                context.showErrorMessage(msg: state.message);
              }
            }, builder: (context, state) {
              return ButtonWidget(
                textEntry: "تسجيل الدخول",
                backColor: AppColors().mainWhite,
                textColor: AppColors().gray9,
                onPress: () {
                  context.read<AuthBloc>().add(LogInAuthEvent(
                      email: emailController.text,
                      password: passwordController.text,
                      emailKey: _emailKey,
                      passwordKey: _passwordKey));
                },
              );
            }),
          ],
        ));
  }
}
