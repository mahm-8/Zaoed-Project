import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/loading_extension.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';
import 'package:zaoed/finder/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/finder/Profile/widgets/card_widget/add_card.dart';
import 'package:zaoed/finder/Profile/widgets/cars_widget/drop_menu.dart';

class AddInformation extends StatelessWidget {
   AddInformation({
    super.key  
  });

 final List<String> gender = ["ذكر", "أنثى"];
  final selectGender = "Select gender";
  final controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.successAddInfo(msg: 'تم إضافة البيانات بنجاح');
          Future.delayed(const Duration(seconds: 2), () {
            context.pop();
            context.pop();
          });
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
          const FieldTextWidget(title: 'الاسم كامل', hint: "ادخل الاسم"),
          const FieldTextWidget(title: 'تاريخ الميلاد', hint: "ادخل تاريخ الميلاد"),
          const Text(
            "الجنس",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          DropDownWidget(
              brand: selectGender, list: gender, brandController: controller),
          const FieldTextWidget(title: 'رقم الجوال', hint: "ادخل رقم الجوال"),
          const FieldTextWidget(
              title: 'البريد الإلكتروني', hint: "ادخل البريد الإلكتروني"),
          const FieldTextWidget(title: 'كلمة المرور', hint: "ادخل كلمة المرور"),
        ]),
      ),
    );
  }
}