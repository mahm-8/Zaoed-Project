import 'package:zaoed/constants/imports.dart';

AppBar ProfailAppBar(BuildContext context) {
  return AppBar(
      backgroundColor: AppColors().gray9,
      title: Text(
        'علي محمد',
        style: TextStyle(color: AppColors().white),
      ),
      leadingWidth: 100,
      titleSpacing: -18,
      toolbarHeight: 80,
      leading: IconButton(
          onPressed: () {},
          icon: ClipOval(
              child: Container(
                  width: 50,
                  height: 50,
                  color: AppColors().gray6,
                  child: ImageIcon(
                    const AssetImage('lib/assets/icons/person.png'),
                    color: AppColors().white,
                  )))));
}
