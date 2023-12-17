import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/providor_show_dialogs/components/button_row_widget.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.bodyText,
    this.imageIcon,
    required this.button1,
    required this.button2,
  });
  final String title, bodyText;
  final String button1, button2;

  final ImageIcon? imageIcon;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      backgroundColor: AppColors().gray6,
      insetAnimationDuration: const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: 220,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (imageIcon != null) imageIcon!,
                  if (imageIcon != null)
                    SizedBox(
                      width: 8,
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
              const SizedBox(
                height: 8,
              ),
              Text(
                bodyText,
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: "SfArabic",
                    color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 32,
              ),
              ButtonRowWidget(
                buttontext1: button1,
                buttontext2: button2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
