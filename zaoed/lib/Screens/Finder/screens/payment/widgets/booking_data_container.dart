import 'package:zaoed/constants/imports.dart';

class BookingDataContainer extends StatelessWidget {
  const BookingDataContainer({
    super.key,
    required this.type,
    required this.hour,
    required this.image,
  });

  final String type;
  final String hour;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 85,
      decoration: BoxDecoration(
          color: AppColors().gray6, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(children: [
          Container(
            height: 57,
            width: 57,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors().white,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 29,
                  height: 29,
                ),
                Text(
                  type,
                  style: TextStyle(color: AppColors().white, fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'منفذ تيسلا الإلكتروني',
                style: TextStyle(color: AppColors().white, fontSize: 16),
              ),
              Text(
                'مدة الحجز: $hour ',
                style: TextStyle(color: AppColors().white, fontSize: 16),
              )
            ],
          )
        ]),
      ),
    );
  }
}
