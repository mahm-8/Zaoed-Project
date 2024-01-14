import 'package:zaoed/constants/imports.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'من نحن'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Container(
            width: context.getWidth(),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors().gray6,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('lib/assets/icons/Vector 3.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'تطبيق زوِّد',
                        style: const TextStyle().style30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'صُمم تطبيق (زوِّد) للمساهمة في تعزيز انتشار السيارات الكهربائية بهدف مواكبة التطور التقني ونمو الصناعة السعودية في المستقبل بالإضافة لكون هذا التطور يعد صديقاً للبيئة. تم تصميم تطبيق (زوِّد) للمساعدة في توفير معلومات عن أقرب محطةشحن للسيارة بالإضافة لعرض أقرب منزل يمثل كنقطة شحن لتحسين تجربة المستخدم وزيادة راحتهم وثقتهم عند استخدام التطبيق.',
                    style: TextStyle(
                      color: AppColors().white,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
