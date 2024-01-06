// ignore: must_be_immutable

import 'package:zaoed/constants/imports.dart';

class BankInformationScreen extends StatelessWidget {
  BankInformationScreen({super.key});
  final cardNameController = TextEditingController(),
      idController = TextEditingController(),
      cardNumberController = TextEditingController(),
      bankNameController = TextEditingController(),
      nationalAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'البيانات البنكية'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 27),
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
            ),
            const Spacer(),
            ButtonWidget(
              textEntry: "إضافة",
              backColor: AppColors().green,
              textColor: AppColors().gray9,
              onPress: () {
                addBankShowDialog(context);
                Future.delayed(const Duration(seconds: 2), () {
                  context.pop();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
