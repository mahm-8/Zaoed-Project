import 'package:zaoed/constants/imports.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(
        "English",
        style: const TextStyle().style9,
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
