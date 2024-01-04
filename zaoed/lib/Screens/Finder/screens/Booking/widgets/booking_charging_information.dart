import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/text_style.dart';

class BookingChargingInformation extends StatelessWidget {
  const BookingChargingInformation({
    super.key,
    this.type,
    this.image,
  });
  final String? type;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "المنفذ",
            style: const TextStyle().style17,
          ),
          Row(
            children: [
              image != null
                  ? Image.asset(
                      image!,
                      width: 21,
                      height: 20,
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 8,
              ),
              Text(
                type ?? "",
                style: const TextStyle().style18,
              )
            ],
          ),
        ],
      ),
    );
  }
}
