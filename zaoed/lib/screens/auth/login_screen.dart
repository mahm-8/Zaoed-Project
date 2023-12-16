import 'package:flutter/material.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/validtor.dart';
import 'package:zaoed/screens/auth/components/textfield_widget.dart';
import 'package:zaoed/screens/auth/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController(),
      passwordController = TextEditingController();

  //tab controller
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
            TextfieldWidget(
              keyboardType: TextInputType.emailAddress,
              hint: 'ادخل كلمة السر',
              controller: passwordController,
              obscure: true,
              displayPass: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return "ادخل كلمة السر";
                }
                if (!value.isValidPassword) {
                  return "كلمة السر غير صحيحة";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                "ليس لديك حساب؟ إنشاء حساب",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors().mainWhite,
                    fontFamily: "SfArabic"),
              ),
            ),
            ButtonWidget(
              textEntry: "إرسال رمز التحقق",
              backColor: AppColors().mainWhite,
              textColor: AppColors().gray9,
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OTPScreen(email: emailController.text)));
              },
            ),
          ],
        ));
  }
}
