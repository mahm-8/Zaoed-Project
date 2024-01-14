import 'package:zaoed/constants/imports.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.bodyText,
    this.imageIcon,
    required this.button1,
    required this.button2,
    this.pressOne,
    this.pressTwo,
  });
  final String title, bodyText;
  final String button1, button2;

  final ImageIcon? imageIcon;
  final Function()? pressOne, pressTwo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: key,
      alignment: Alignment.center,
      backgroundColor: AppColors().gray6,
      insetAnimationCurve: Curves.easeInOutExpo,
      insetAnimationDuration: const Duration(seconds: 2),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        height: 220,
        width: context.getWidth(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (imageIcon != null) imageIcon!,
                  if (imageIcon != null)
                    const SizedBox(
                      width: 8,
                    ),
                  Text(
                    title,
                    style: const TextStyle().style1,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                bodyText,
                style: const TextStyle().style2,
              ),
              const Spacer(),
              ButtonRowWidget(
                buttontext1: button1,
                onPress1: pressOne,
                buttontext2: button2,
                onPress2: pressTwo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
