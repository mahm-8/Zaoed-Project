import 'package:zaoed/constants/imports.dart';

class LegalAffairsLable extends StatelessWidget {
  const LegalAffairsLable({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
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
              style: const TextStyle().style6,
            ),
            const Spacer(),
            Image.asset('lib/assets/icons/small-left-solid.png'),
          ],
        ),
      ),
    );
  }
}
