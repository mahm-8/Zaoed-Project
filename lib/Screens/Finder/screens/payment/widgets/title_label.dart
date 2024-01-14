import 'package:zaoed/constants/imports.dart';

class TitleLabel extends StatelessWidget {
  const TitleLabel({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors().white,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
