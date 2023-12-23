import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class SpanText extends StatelessWidget {
  const SpanText(
      {super.key,
      required this.title,
      this.result = "",
      this.color = Colors.grey,
      this.image = "",
      this.sizeTitle = 14,
      this.resultTitle = 14});
  final String title;
  final String? result;
  final Color? color;
  final String? image;
  final double? sizeTitle;
  final double? resultTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(color: AppColors().gray, fontSize: sizeTitle)),
        image == ""
            ? Text(result ?? "",
                style: TextStyle(color: color, fontSize: resultTitle))
            : Image.asset(
                image!,
                height: 20,
                width: 20,
              )
      ],
    );
  }
}
