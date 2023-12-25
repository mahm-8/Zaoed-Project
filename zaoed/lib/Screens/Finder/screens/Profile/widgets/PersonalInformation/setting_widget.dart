import 'package:zaoed/constants/imports.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/Settings.png',
          title: 'الإعدادات',
          onTap: () {},
        ),
        Divider(
          thickness: 1,
          color: AppColors().black,
        ),
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/sign.png',
          title: 'المحفوظات',
          onTap: () {},
        ),
      ]),
    );
  }
}
