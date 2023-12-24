import 'package:zaoed/constants/imports.dart';

class AddedDialog extends StatelessWidget {
  const AddedDialog({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const OutlineInputBorder(borderSide: BorderSide.none),
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
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 17, color: AppColors().mainWhite),
          ),
        ),
      ),
    );
  }
}
