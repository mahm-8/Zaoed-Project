import 'package:zaoed/constants/imports.dart';

AppBar profailAppBar(BuildContext context) {
  return AppBar(
      backgroundColor: AppColors().gray9,
      title: Text(
        'مرحبا',
        style: TextStyle(color: AppColors().white),
      ),
      leadingWidth: 100,
      titleSpacing: -18,
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
