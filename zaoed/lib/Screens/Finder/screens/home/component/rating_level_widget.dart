import 'package:zaoed/constants/imports.dart';

class RatingLevelWidget extends StatelessWidget {
  const RatingLevelWidget({
    super.key,
    required this.title,
    required this.imagUrl,
    required this.isChecked,
    required this.onChecked,
  });
  final String title, imagUrl;
  final bool isChecked;
  final ValueChanged<bool?> onChecked;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imagUrl),
          Text(
            title,
            style: const TextStyle().style33,
          ),
          Checkbox(
            activeColor: AppColors().green,
            checkColor: AppColors().mainWhite,
            shape: const CircleBorder(),
            value: isChecked,
            side: BorderSide(color: AppColors().mainWhite),
            onChanged: onChecked,
          ),
        ],
      ),
    );
  }
}
