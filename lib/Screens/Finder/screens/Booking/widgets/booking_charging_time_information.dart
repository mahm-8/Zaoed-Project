import 'package:zaoed/constants/imports.dart';

class BookingChargingTimeInformation extends StatelessWidget {
  const BookingChargingTimeInformation({
    super.key,
    this.hour,
  });
  final String? hour;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "مدة الشحن",
          style: const TextStyle().style17,
        ),
        Text(
          hour ?? "",
          style: const TextStyle().style19,
        ),
      ],
    );
  }
}
