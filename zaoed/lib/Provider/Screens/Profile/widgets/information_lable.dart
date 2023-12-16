import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class InformationLabel extends StatelessWidget {
  const InformationLabel(
      {super.key,
      required this.title,
      required this.imageIcon,
      required this.onTap});
  final String imageIcon;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      child: InkWell(
        onTap: onTap,
        child: Row(
          
          children: [
            Image.asset(
              imageIcon,
              color: AppColors().green,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: TextStyle(color: AppColors().white),
            ),
            const Spacer(),
            Image.asset('lib/assets/icons/small-left-solid.png'),
          ],
        ),
      ),
    );
  }
}
