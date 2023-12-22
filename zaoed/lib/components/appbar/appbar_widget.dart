import 'package:flutter/material.dart';
import 'package:zaoed/home/home_screen.dart';

import '../../constants/colors.dart';

AppBar customAppBar(
  BuildContext context, {
  bool hasAction = false,
  bool showIcon = false,
  String? title,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Visibility(
          visible: showIcon,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors().mainWhite,
            size: 18,
          ),
        )),
    title: Text(
      title ?? "",
      style: TextStyle(
          color: AppColors().mainWhite,
          fontSize: 20,
          fontWeight: FontWeight.w700),
    ),
    actions: [
      Visibility(
        visible: hasAction,
        child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              child: Text(
                "الرئيسية",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors().mainWhite),
              ),
            )),
      ),
      const SizedBox(
        width: 30,
      ),
    ],
  );
}
