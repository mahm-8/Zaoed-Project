import 'package:zaoed/constants/imports.dart';

class BookingChargingTimeInformation extends StatelessWidget {
  const BookingChargingTimeInformation({
    super.key, this.hour,
  });
  final String? hour;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "مدة الشحن",
          style: TextStyle(fontSize: 19, color: AppColors().white),
        ),
        Text(
          hour??"",
          style: TextStyle(
              fontSize: 16,
              color: AppColors().white,
              fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
