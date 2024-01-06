import 'package:zaoed/constants/imports.dart';

class PublicSittings extends StatelessWidget {
  const PublicSittings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: context.getWidth(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InformationLabel(
          imageIcon: 'lib/assets/icons/Settings.png',
          title: 'الإعدادات',
          onTap: () {
            context.push(view: SettingsScreen());
          },
        ),
        Divider(
          thickness: 1,
          color: AppColors().gray9,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/sign.png',
          title: 'المحفوظات',
          onTap: () {
            context.push(view: const SavedBookmarksScreen());
          },
        ),
      ]),
    );
  }
}
