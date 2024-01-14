import 'package:zaoed/constants/imports.dart';

class LegalAffairsScreen extends StatelessWidget {
  const LegalAffairsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'الشؤون القانونية'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Container(
            height: 240,
            width: context.getHeight(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors().gray6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LegalAffairsLable(
                  title: 'حقوق النشر',
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                LegalAffairsLable(
                  title: 'الأحكام والشروط',
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                LegalAffairsLable(
                  title: 'سياسة الخصوصية',
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                LegalAffairsLable(
                  title: 'مقدمي البيانات',
                  onTap: () {},
                ),
                Divider(
                  thickness: 1,
                  color: AppColors().gray9,
                ),
                LegalAffairsLable(
                  title: "ترخيص البرنامج",
                  onTap: () {},
                ),
              ],
            )),
      ),
    );
  }
}
