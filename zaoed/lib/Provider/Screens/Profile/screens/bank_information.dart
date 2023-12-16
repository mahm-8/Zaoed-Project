import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/bank_text_field.dart';
import 'package:zaoed/constants/colors.dart';

class BankInformationScreen extends StatelessWidget {
  BankInformationScreen({super.key});
  TextEditingController cardNameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController nationalAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ProfailScreenAppBar(context, title: 'البيانات البنكية'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            BankTextField(
              controller: cardNameController,
              hint: 'الأسم على البطاقة',
              label: 'الاسم الكامل',
            ),
            BankTextField(
              controller: idController,
              hint: 'رقم الهوية',
              label: "أدخل رقم الهوية",
            ),
            BankTextField(
              controller: cardNumberController,
              hint: "رقم الآيبان",
              label: "أدخل رقم الآيبان",
            ),
            BankTextField(
              controller: bankNameController,
              hint: "أسم البنك ",
              label: "أدخل أسم البنك",
            ),
            BankTextField(
              controller: nationalAddressController,
              hint: "العنوان الوطني",
              label: "أدخل رقم العنوان الوطني",
            )
          ],
        ),
      ),
    );
  }
}
