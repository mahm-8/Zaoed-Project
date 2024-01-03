
import 'package:zaoed/constants/imports.dart';

class BookChargeButton extends StatelessWidget {
  const BookChargeButton({
    super.key,
    this.onPress,
  });
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: 96,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
            backgroundColor: AppColors().green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColors().green))),
        onPressed: onPress,
        child: Text("حجز",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors().gray8,
            )),
      ),
    );
  }
}
