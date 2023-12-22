import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:zaoed/constants/colors.dart';

class ButtonChoiceWidget extends StatelessWidget {
  const ButtonChoiceWidget({
    super.key,
    required this.imageUrl, this.onPress,
  });

  final String imageUrl;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: GlassContainer(
        height: 48,
        width: 48,
        blur: 4,
        color: AppColors().gray1Trans,
        shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(24),
        border: Border.fromBorderSide(
            BorderSide(color: AppColors().green, width: 0.4)),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
