import 'package:zaoed/constants/imports.dart';

class InformationLabel extends StatelessWidget {
  const InformationLabel(
      {super.key,
      required this.title,
      required this.imageIcon,
      required this.onTap});
  final String imageIcon;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageIcon,
              color: AppColors().green,
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: const TextStyle().style13,
            ),
            const Spacer(),
            Image.asset('lib/assets/icons/small-left-solid.png'),
          ],
        ),
      ),
    );
  }
}
