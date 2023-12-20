import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      const Text(
        "English",
        style: TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      Image.asset(
        "lib/assets/icons/language.png",
        width: 25,
      ),
    ]);
  }
}
