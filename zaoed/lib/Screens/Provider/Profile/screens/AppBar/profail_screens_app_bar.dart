import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

AppBar profileScreenAppBar(BuildContext context, {title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: AppColors().white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: AppColors().gray9,
    leading: IconButton(
      icon: ImageIcon(
        const AssetImage('lib/assets/icons/Arrow-Right.png'),
        color: AppColors().white,
      ),
      onPressed: () {
        context.pop();
      },
    ),
  );
}
