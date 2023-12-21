import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class SettingsLabel extends StatelessWidget {
  const SettingsLabel({
    super.key,
    required this.title,
    required this.onTap,
    required this.subTitle,
  });
  final String title;
  final Function() onTap;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: AppColors().white, fontSize: 16),
          ),
          Spacer(),
          Text(
            subTitle,
            style: TextStyle(color: Colors.grey),
          ),
          Image.asset('lib/assets/icons/small-left-solid.png'),
         
        ],
      ),
    );
  }
}
