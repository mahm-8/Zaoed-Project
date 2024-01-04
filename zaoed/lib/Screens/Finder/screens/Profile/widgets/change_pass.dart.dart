import 'package:zaoed/constants/imports.dart';

import 'card_widget/field_text_widget.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({
    super.key,
  });

  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // final user = UserModel(
          //     name: nameController.text,
          //     phone: phoneController.text,
          //     birthday: dateController.text,
          //     gender: selectGender);
          // print(user);
          // context
          //     .read<AuthBloc>()
          //     .add(UpdatePassword(passController.text, emailController.text));
          // context.push(view: TabBarLogin());
          // context.showLoading();
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: AppColors().gray8,
            minimumSize: Size(context.getWidth(divide: 1.1), 40),
            backgroundColor: AppColors().green),
        child: const Text(
          "حفظ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      backgroundColor: AppColors().gray9,
      appBar: appBar(context, title: 'البيانات الشخصية'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [
          FieldTextWidget(
              controller: emailController,
              title: 'البريد الإلكتروني',
              hint: "ادخل البريد الإلكتروني"),
          FieldTextWidget(
            title: 'كلمة المرور',
            hint: "ادخل كلمة المرور",
            controller: passController,
          ),
        ]),
      ),
    );
  }
}
