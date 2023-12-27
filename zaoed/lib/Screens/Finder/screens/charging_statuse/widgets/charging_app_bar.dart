import 'package:zaoed/constants/imports.dart';

AppBar ChargingAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      'حالة الشحن',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: AppColors().white),
    ),
    centerTitle: true,
    backgroundColor: AppColors().gray9,
  );
}
