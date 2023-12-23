import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ChargersWidget extends StatelessWidget {
  const ChargersWidget({
    super.key,
    required this.imageAsset,
    required this.name,
  });

  final String imageAsset, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      width: 78,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors().gray6)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imageAsset,
            ),
            Text(
              name,
              style: TextStyle(color: AppColors().white, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
