import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingTypeContainer extends StatelessWidget {
  const ChargingTypeContainer({super.key,
    required this.imageUrl,
    required this.type,
    this.isSelected = false, 
  });

  final String imageUrl;
  final String type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      width: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? AppColors().green : AppColors().gray6,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Column(
          children: [
            Image.asset(imageUrl),
            Text(
              type,
              style: TextStyle(
                color: isSelected ? AppColors().green : AppColors().white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}