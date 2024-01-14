import 'package:zaoed/constants/imports.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.textEntry,
    required this.backColor,
    required this.textColor,
    this.onPress,
  });

  final String textEntry;
  final Color backColor;
  final Color textColor;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: backColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors().green))),
        onPressed: onPress,
        child: Text(textEntry,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: textColor,
            )),
      ),
    );
  }
}
