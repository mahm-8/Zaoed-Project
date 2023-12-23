import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class SpanText extends StatelessWidget {
  const SpanText(
      {super.key,
      required this.title,
      this.result = "",
      this.color = Colors.grey,
      this.image = ""});
  final String title;
  final String? result;
  final Color? color;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(color: AppColors().gray)),
        image == ""
            ? Text(result??"", style: TextStyle(color: color))
            : Image.asset(
                image!,
                height: 20,
                width: 20,
              )
      ],
    );
  }
}