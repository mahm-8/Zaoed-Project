import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class StateDialog extends StatelessWidget {
  const StateDialog({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      backgroundColor: AppColors().gray6,
      insetAnimationDuration: const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: 145,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("lib/assets/icons/lets-icons_done-round.png"),
              const SizedBox(
                height: 16,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SfArabic",
                    color: AppColors().mainWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
