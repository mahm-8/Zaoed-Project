import 'dart:math';

import 'package:zaoed/constants/imports.dart';

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
              const Bill(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ButtonWidget(
                    textEntry: 'الرئيسية',
                    backColor: AppColors().green,
                    onPress: onTap,
                    textColor: AppColors().gray9),
              ),
            ],
          ),
        ));
  }
}
