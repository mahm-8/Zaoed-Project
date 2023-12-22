import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

AppBar appBar(BuildContext context, {required String title}) {
  return AppBar(
    foregroundColor: AppColors().white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: AppColors().white, fontWeight: FontWeight.w700),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    bottom: const PreferredSize(preferredSize: Size(0, 0), child: Divider()),
  );
}
