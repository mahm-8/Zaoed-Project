import 'package:zaoed/constants/imports.dart';

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget({
    super.key,
    required this.buttontext1,
    required this.buttontext2,
    this.onPress1,
    this.onPress2,
    this.backColor,
  });
  final String buttontext1, buttontext2;
  final Function()? onPress1, onPress2;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DialogButton(
          textEntry: buttontext1,
          backColor: AppColors().green,
          textColor: AppColors().gray6,
          onPress: onPress1,
        ),
        DialogButton(
          textEntry: buttontext2,
          backColor: AppColors().gray6,
          textColor: AppColors().green,
          onPress: onPress2,
        ),
      ],
    );
  }
}
