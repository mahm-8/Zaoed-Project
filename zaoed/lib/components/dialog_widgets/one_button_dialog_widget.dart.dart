import 'package:flutter/material.dart';
import 'package:zaoed/providor_show_dialogs/components/dialog_button.dart';

import '../../constants/colors.dart';

class DialogWidgetOneButton extends StatelessWidget {
  const DialogWidgetOneButton({
    super.key,
    required this.title,
    required this.bodyText,
    required this.button1,
    this.pressOne,
  });
  final String title, bodyText;
  final String button1;

  final Function()? pressOne;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: key,
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
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                bodyText,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColors().mainWhite),
              ),
              const SizedBox(
                height: 32,
              ),
              DialogButton(
                textEntry: button1,
                backColor: AppColors().green,
                textColor: AppColors().gray6,
                onPress: pressOne,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
