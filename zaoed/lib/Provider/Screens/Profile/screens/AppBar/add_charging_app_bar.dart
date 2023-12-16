import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

AppBar AddChargingScreenAppBar(BuildContext context, {title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: AppColors().white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: AppColors().gray9,
    actions: [
      TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'إلغاء',
            style: TextStyle(color: AppColors().white),
          ))
    ],
  );
}
