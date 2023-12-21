import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPress,
    required this.textEntry,
    required this.backColor,
    required this.textColor,
  });

  final Function()? onPress;
  final String textEntry;
  final Color backColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
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
