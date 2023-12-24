import 'package:zaoed/constants/imports.dart';

class RatingLevelWidget extends StatelessWidget {
  const RatingLevelWidget({
    super.key,
    required this.title,
    required this.imagUrl,
  });
  final String title, imagUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imagUrl),
          Text(
            title,
            style: TextStyle(fontSize: 9, color: AppColors().mainWhite),
          ),
        ],
      ),
    );
  }
}
