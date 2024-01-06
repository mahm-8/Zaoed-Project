import 'package:zaoed/constants/imports.dart';

class PersonalInformationLabel extends StatelessWidget {
  const PersonalInformationLabel({
    super.key,
    required this.title,
    required this.onTap,
    required this.subTitle,
  });
  final String title;
  final Function() onTap;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(color: AppColors().white, fontSize: 18),
            ),
            const Spacer(),
            Text(
              subTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset('lib/assets/icons/edit_w.png'),
          ],
        ),
      ),
    );
  }
}
