import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/outline_style.dart';
import 'package:zaoed/extensions/text_style.dart';

class AddedDialog extends StatelessWidget {
  const AddedDialog({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: OutlineStyle.noneBorder,
      alignment: Alignment.bottomCenter,
      backgroundColor: AppColors().gray6,
      insetAnimationDuration: const Duration(milliseconds: 100),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 0.3, color: AppColors().green),
              left: BorderSide(width: 0.3, color: AppColors().green)),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: context.getWidth(),
        child: Center(
          child: Text(
            title,
            style: const TextStyle().style2,
          ),
        ),
      ),
    );
  }
}
