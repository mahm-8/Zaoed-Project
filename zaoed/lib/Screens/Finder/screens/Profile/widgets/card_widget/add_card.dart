import 'package:zaoed/constants/imports.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.pop();
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: AppColors().gray8,
            minimumSize: Size(context.getWidth(divide: 1.1), 40),
            backgroundColor: AppColors().green),
        child: const Text("إضافة"),
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
            const FieldTextWidget(
              title: 'الاسم كامل',
              hint: 'الاسم على البطاقة',
            ),
            const FieldTextWidget(
              title: 'الاسم كامل',
              hint: 'الاسم على البطاقة',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: context.getWidth(divide: 3),
                  child: const FieldTextWidget(
                    title: 'التاريخ',
                    hint: 'الشهر/السنة',
                  ),
                ),
                SizedBox(
                  width: context.getWidth(divide: 3),
                  child: const FieldTextWidget(
                    title: 'رمز التحقق',
                    hint: 'CVV',
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

class FieldTextWidget extends StatelessWidget {
  const FieldTextWidget(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.hint = "",
      this.keyboardType = TextInputType.text,
      this.isFelid = true,
      this.onTap,
      this.controller});

  final String title;
  final String hint;
  final int maxLines;

  final TextInputType? keyboardType;
  final bool isFelid;
  final Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            InkWell(
              onTap: !isFelid ? onTap : null,
              child: TextField(
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors().white,
                ),
                controller: controller,
                minLines: maxLines,
                maxLines: maxLines,
                enabled: isFelid,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  fillColor: AppColors().gray6,
                  filled: true,
                  hintStyle: TextStyle(color: AppColors().white),
                  hintText: hint,
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight(divide: 3.9),
      width: context.getWidth(divide: 1.1),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              width: context.getWidth(divide: 1.2),
              height: context.getHeight(divide: 4.1),
              decoration: BoxDecoration(
                  gradient: AppColors().pageRadiant,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Positioned(
              top: 23,
              right: 20,
              child: Image.asset("lib/assets/icons/atheer.png")),
          Positioned(
              top: 25,
              right: 45,
              child: Image.asset("lib/assets/icons/cridt.png")),
          Positioned(
              top: 30,
              left: 20,
              child: Image.asset("lib/assets/icons/mastercard.png")),
          Positioned(
              top: 110,
              left: 30,
              child: Image.asset("lib/assets/icons/.....png")),
          Positioned(
              top: 140,
              left: 30,
              child: Text(
                "Card Holder",
                style: TextStyle(color: AppColors().white),
              )),
          Positioned(
              top: 140,
              right: 30,
              child: Text("Card Holder",
                  style: TextStyle(color: AppColors().white))),
          Positioned(
              top: 160,
              left: 30,
              child: Text("**** **** **** ****",
                  style: TextStyle(color: AppColors().white))),
          Positioned(
              top: 160,
              right: 30,
              child:
                  Text("********", style: TextStyle(color: AppColors().white))),
        ],
      ),
    );
  }
}
