// ignore_for_file: must_be_immutable

import 'package:zaoed/constants/imports.dart';

class BookingLocationInformation extends StatelessWidget {
  BookingLocationInformation({
    super.key,
  });
  BookmarkModel? bookmarks;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الموقع",
          style: TextStyle(fontSize: 19, color: AppColors().white),
        ),
        Text(
          '${bookmarks?.chargingPoint.pointName}',
          style: TextStyle(fontSize: 17, color: AppColors().white),
        ),
        Text(
          "${bookmarks?.chargingPoint.longitude}, ${bookmarks?.chargingPoint.latitude}",
          style: TextStyle(
              color: AppColors().white,
              fontSize: 12,
              fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
