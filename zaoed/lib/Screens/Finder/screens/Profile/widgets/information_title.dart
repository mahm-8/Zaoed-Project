import 'package:zaoed/constants/imports.dart';

class TitleInfoWidget extends StatelessWidget {
  const TitleInfoWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(color: AppColors().white, fontSize: 20),
      ),
    );
  }
}
