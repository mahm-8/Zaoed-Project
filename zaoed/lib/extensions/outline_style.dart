import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/border_style.dart';

extension OutlineStyle on OutlineInputBorder {
  static OutlineInputBorder defaultEnabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[400]!),
    borderRadius: BorderStyleExtension.defaultBorderRadius,
  );

  static OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder defaultRatingBorder =
      OutlineInputBorder(borderSide: BorderSide(color: AppColors().green));

  static OutlineInputBorder defaultFocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[600]!),
    borderRadius: BorderStyleExtension.defaultBorderRadius,
  );

  static OutlineInputBorder noneBorder =
      const OutlineInputBorder(borderSide: BorderSide.none);
  static OutlineInputBorder none30Border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderStyleExtension.border30Radius);

  static OutlineInputBorder transparentBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent));

  static OutlineInputBorder deafultTextfieldError = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors().green, width: 0.4),
    borderRadius: BorderStyleExtension.defaultBorderRadius,
  );

  static OutlineInputBorder defaultTextfieldEnabled = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors().green, width: 0.4),
    borderRadius: BorderStyleExtension.defaultBorderRadius,
  );

  static OutlineInputBorder defaultTextfieldfocused = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors().green, width: 0.4),
    borderRadius: BorderStyleExtension.defaultBorderRadius,
  );
  static OutlineInputBorder defaultTextfieldError = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors().green, width: 0.4),
    borderRadius: BorderStyleExtension.defaultBorderRadius,
  );

  static OutlineInputBorder defaultErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderStyleExtension.defaultBorderRadius,
  );

  static OutlineInputBorder raduisOutlineBorder = OutlineInputBorder(
      borderRadius: BorderStyleExtension.defaultBorderRadius);

  static OutlineInputBorder default15Outline = OutlineInputBorder(
      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15));
}
