import 'package:flutter/material.dart';
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
}
