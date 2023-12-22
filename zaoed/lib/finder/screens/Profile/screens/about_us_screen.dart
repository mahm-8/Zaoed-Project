import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/finder/screens/Profile/screens/AppBar/profail_screens_app_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: appBar(context, title: 'من نحن'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Container(
            width: 350,
            height: 243,
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
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'تطبيق زوِّد',
                        style: TextStyle(
                            color: AppColors().white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
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
