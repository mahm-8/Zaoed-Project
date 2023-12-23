import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Provider/Profile/methods_show_dialog/delete_charging_point_show_diialog.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

AppBar AddChargingScreenAppBar(BuildContext context,
    {title, isEditing = false}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: AppColors().white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: AppColors().gray9,
    leading: Visibility(
        visible: isEditing,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 18),
          child: Text(
            'تعديل',
            style: TextStyle(color: AppColors().white),
          ),
        )),
    actions: [
      TextButton(
          onPressed: () {
            DeleteChargingPointShowDialog(context);
            Future.delayed(const Duration(seconds: 2), () {
              context.pop();
            });
          },
          child: Text(
            'إلغاء',
            style: TextStyle(color: AppColors().white),
          ))
    ],
  );
}
