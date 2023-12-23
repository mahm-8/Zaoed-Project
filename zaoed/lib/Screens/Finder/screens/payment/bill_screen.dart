import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/payment/widgets/bill.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.getWidth(),
        height: context.getHeight() / 1.3,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Bill(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ButtonWidget(
                    textEntry: 'الرئيسية',
                    backColor: AppColors().green,
                    onPress: onTap,
                    textColor: AppColors().white),
              ),
            ],
          ),
        ));
  }
}
