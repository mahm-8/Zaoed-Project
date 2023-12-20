import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/ScreensWidgets/bank_text_field.dart';
import 'package:zaoed/constants/colors.dart';

class BankInformationScreen extends StatelessWidget {
  BankInformationScreen({super.key});
  final cardNameController = TextEditingController();
  final idController = TextEditingController();
  final cardNumberController = TextEditingController();
  final bankNameController = TextEditingController();
  final nationalAddressController = TextEditingController();

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
              hint: "أدخل رقم الهوية",
              label: 'رقم الهوية',
            ),
            BankTextField(
              controller: cardNumberController,
              hint: "أدخل رقم الآيبان",
              label: "رقم الآيبان",
            ),
            BankTextField(
              controller: bankNameController,
              hint: "أدخل أسم البنك",
              label: "أسم البنك ",
            ),
            BankTextField(
              controller: nationalAddressController,
              hint: "أدخل رقم العنوان الوطني",
              label: "العنوان الوطني",
            )
          ],
        ),
      ),
    );
  }
}
