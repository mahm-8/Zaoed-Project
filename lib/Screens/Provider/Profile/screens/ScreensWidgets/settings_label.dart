import 'package:zaoed/constants/imports.dart';

class SettingsLabel extends StatelessWidget {
  const SettingsLabel({
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
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle().style6,
          ),
          const Spacer(),
          Text(
            subTitle,
            style: const TextStyle(color: Colors.grey),
          ),
          Image.asset('lib/assets/icons/small-left-solid.png'),
        ],
      ),
    );
  }
}
