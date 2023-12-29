import 'package:zaoed/constants/imports.dart';

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
            style: TextStyle(fontSize: 19, color: AppColors().white),
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
                style: TextStyle(
                    color: AppColors().white, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ],
      ),
    );
  }
}
