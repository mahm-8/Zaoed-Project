// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/blocs/auth_bloc/auth_bloc.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/extensions/validtor.dart';
import 'package:zaoed/Screens/auth/components/textfield_widget.dart';
import 'package:zaoed/Screens/auth/otp_screen.dart';
import '../tabbar_login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  bool pass = false;
  final _userNameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final nameController = TextEditingController(),
      emailController = TextEditingController(),
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
            keyForm: _userNameKey,
            keyboardType: TextInputType.name,
            hint: 'ادخل الاسم كامل',
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "ادخل الاسم";
              }
              return null;
            },
          ),
          TextfieldWidget(
            keyForm: _emailKey,
            keyboardType: TextInputType.emailAddress,
            hint: 'ادخل البريد الإلكتروني',
            controller: emailController,
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TabBarLogin()));
            },
            child: Text(
              "لديك حساب مسبقاً؟ تسجيل الدخول",
              style: TextStyle(
                fontSize: 14,
                color: AppColors().mainWhite,
              ),
            ),
          ),
          BlocListener<AuthBloc, AuthStates>(
            listener: (context, state) {
              if (state is SuccessSignupState) {
                context.push(view: OTPScreen(email: emailController.text));
              }
            },
            child: ButtonWidget(
              textEntry: "إرسال رمز التحقق",
              backColor: AppColors().mainWhite,
              textColor: AppColors().gray8,
              onPress: () {
                context.read<AuthBloc>().add(SignUpEvent(
                    emailController.text,
                    passwordController.text,
                    nameController.text,
                    _emailKey,
                    _passwordKey,
                    _userNameKey));
              },
            ),
          ),
        ],
      ),
    );
  }
}
