import 'package:zaoed/constants/imports.dart';

import 'card_widget.dart';

// ignore: must_be_immutable
class AddCard extends StatelessWidget {
  AddCard({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  TextEditingController expDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocListener<CardBloc, CardState>(
        listener: (context, state) {
          if (state is AddCardState) {
            context.pushAndRemoveUntil(view: const CardScreen());
          }
        },
        child: ElevatedButton(
          onPressed: () {
            context.read<CardBloc>().add(AddCardEvent(
                name: nameController.text,
                cardNumber: cardNumberController.text,
                endDate: expDateController.text,
                cvv: cvvController.text));
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              foregroundColor: AppColors().gray8,
              minimumSize: Size(context.getWidth(divide: 1.1), 40),
              backgroundColor: AppColors().green),
          child: const Text("إضافة"),
        ),
      ),
      backgroundColor: AppColors().gray9,
      appBar: appBar(context, title: 'إضافة بطاقة'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const CardWidget(),
            const SizedBox(
              height: 20,
            ),
            FieldTextWidget(
              title: 'الاسم كامل',
              hint: 'الاسم على البطاقة',
              controller: nameController,
            ),
            FieldTextWidget(
              title: 'رقم البطاقة',
              hint: 'الرقم على البطاقة',
              controller: cardNumberController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: context.getWidth(divide: 3),
                  child: FieldTextWidget(
                    title: 'التاريخ',
                    hint: 'الشهر/السنة',
                    controller: expDateController,
                  ),
                ),
                SizedBox(
                  width: context.getWidth(divide: 3),
                  child: FieldTextWidget(
                    title: 'رمز التحقق',
                    hint: 'CVV',
                    controller: cvvController,
                  ),
                ),
              ],
            ),
            Text(
              "سنقوم بحسم وإرجاع مبلغ (1.00 ريال) للتحقق من البطاقة عند موافقتك.",
              style: TextStyle(color: AppColors().gray1, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("تعيينها بالطاقة الافتراضية",
                    style: TextStyle(color: AppColors().white)),
                Switch(value: false, onChanged: (val) {}),
              ],
            )
          ],
        ),
      )),
    );
  }
}
