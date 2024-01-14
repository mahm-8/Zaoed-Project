import 'package:zaoed/constants/imports.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) {
            return const DialogWidget(
                title: "تغيير اللغة",
                bodyText:
                    "سيتم تغيير اللغة من العربية للإنجليزية، هل أنت موافق؟",
                button1: "نعم",
                button2: "لا");
          },
        );
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
      ]),
    );
  }
}
