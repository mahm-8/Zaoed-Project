import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

//logo
extension LoadingExtension on BuildContext {
  showLoading() {
    showDialog(
        context: this,
        builder: (context) =>
            const Center(child: CircularProgressIndicator.adaptive()));
  }

  showErrorMessage({String? msg}) {
    showDialog(
        context: this,
        builder: (context) => AlertDialog(
              content: Text(msg!),
            ));
  }

  successAddInfo({String? msg}) {
    showDialog(
        context: this,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              shadowColor: AppColors().green,
              backgroundColor: AppColors().gray6,
              elevation: 2,
              contentTextStyle:
                  TextStyle(fontSize: 18, color: AppColors().white),
              content: Text(msg!),
            ));
  }
}
