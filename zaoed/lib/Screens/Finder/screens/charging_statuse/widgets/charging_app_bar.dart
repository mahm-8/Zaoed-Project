import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/text_style.dart';

AppBar chargingAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      'حالة الشحن',
      style: const TextStyle().buttonstyle1,
    ),
    centerTitle: true,
    backgroundColor: AppColors().gray9,
  );
}
