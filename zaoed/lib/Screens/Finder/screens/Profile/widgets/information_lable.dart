import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class InfoLabelWidget extends StatelessWidget {
  const InfoLabelWidget(
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
              height: 24,
              width: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(color: AppColors().white, fontSize: 17),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_back_ios,
              textDirection: TextDirection.ltr,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
