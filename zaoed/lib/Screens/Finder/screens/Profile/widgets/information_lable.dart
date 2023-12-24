import 'package:zaoed/constants/imports.dart';

class InfoLabelWidget extends StatelessWidget {
  const InfoLabelWidget(
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              imageIcon,
              color: AppColors().green,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: TextStyle(color: AppColors().white),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_back_ios,
              textDirection: TextDirection.ltr,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
