import 'package:zaoed/constants/imports.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocListener<CardBloc, CardState>(
        listener: (context, state) {
          if (state is AddCardState) {
            context.pushAndRemoveUntil(view: const CardScreen());
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: ButtonWidget(
              textEntry: "إضافة",
              onPress: () {
                context.read<CardBloc>().add(AddCardEvent(
                    name: nameController.text,
                    cardNumber: cardNumberController.text,
                    endDate: expDateController.text,
                    cvv: cvvController.text));
              },
              backColor: AppColors().green,
              textColor: AppColors().gray8),
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
                  width: context.getWidth(divide: 2.4),
                  child: FieldTextWidget(
                    keyboardType: TextInputType.datetime,
                    title: 'التاريخ',
                    hint: 'الشهر/السنة',
                    controller: expDateController,
                  ),
                ),
                SizedBox(
                  width: context.getWidth(divide: 2.4),
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
