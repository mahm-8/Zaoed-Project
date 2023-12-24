
import 'package:zaoed/constants/imports.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPress,
    required this.textEntry,
    required this.backColor,
    required this.textColor,
    this.borderColor,
  });

  final Function()? onPress;
  final String textEntry;
  final Color backColor;
  final Color textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: borderColor ?? Colors.transparent))),
        onPressed: onPress,
        child: Text(textEntry,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: textColor,
            )),
      ),
    );
  }
}
