import 'package:zaoed/constants/imports.dart';

extension LoadingExtension on BuildContext {
  showLoading() {
    showDialog(
        context: this,
        builder: (context) => Center(
                child: CircularProgressIndicator(
              color: AppColors().green,
              strokeAlign: CircularProgressIndicator.strokeAlignCenter,
              strokeWidth: 6,
              strokeCap: StrokeCap.round,
            )));
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
