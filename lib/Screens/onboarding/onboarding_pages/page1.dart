import 'package:zaoed/constants/imports.dart';

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.getHeight() * 0.65,
          ),
          Text(
            "ابحث عن نقطة شحن",
            textAlign: TextAlign.center,
            style: const TextStyle().style36,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "سهولة البحث للمستخدم من خلال استخدام الخريطة لعرض نقاط الشحن الأقرب لموقعه والمناسبة لاحتياجه",
            textAlign: TextAlign.center,
            style: const TextStyle().style22,
          ),
        ],
      ),
    );
  }
}
