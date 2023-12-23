
import 'package:flutter/material.dart';

class BillLabel extends StatelessWidget {
  const BillLabel({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
          const Spacer(),
          Text(
            subTitle,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
