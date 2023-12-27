import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class ChargePointsCard extends StatelessWidget {
  const ChargePointsCard({
    super.key,
    this.bookmarks,
  });
  final BookmarkModel? bookmarks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 62.0),
      child: Container(
        height: 206,
        width: context.getWidth(),
        decoration: BoxDecoration(
          color: AppColors().gray1Trans,
          borderRadius: BorderRadius.circular(16),
          border: Border(
              left: BorderSide(color: AppColors().green, width: 0.4),
              top: BorderSide(color: AppColors().green, width: 0.4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${bookmarks?.chargingPoint.pointName}",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: AppColors().mainWhite,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset("lib/assets/icons/Star.png"),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${bookmarks?.chargingPoint.rating}",
                    style: TextStyle(
                      color: AppColors().mainWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "(${bookmarks?.chargingPoint.chargingTimes})",
                    style: TextStyle(
                      color: AppColors().gray4,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  if (isBookmarked == false)
                    AddToBookmarkDialog(
                      pointName: bookmarks?.chargingPoint.pointName,
                      pointLocation: bookmarks?.chargingPoint.pointLocation,
                      chargingPort: bookmarks?.chargingPoint.chargingPort,
                      rating: bookmarks?.chargingPoint.rating,
                      idBookmark: bookmarks?.bookmarkId,
                      chargingTimes: bookmarks?.chargingPoint.chargingTimes,
                      portCount: bookmarks?.chargingPoint.portCount,
                    ),
                  if (isBookmarked == true)
                    RemoveBookMarkDialog(
                      bookmarkID: bookmarks?.bookmarkId,
                    ),
                ],
              ),
              Text(
                "${bookmarks?.chargingPoint.pointLocation}",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: AppColors().gray4,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ChargersRowWidget(
                portCount: bookmarks?.chargingPoint.portCount,
                chargingPort: bookmarks?.chargingPoint.chargingPort,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TrackonGoogleButtonWidget(
                    onPress: () {},
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  BookChargeButton(
                    onPress: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ).asGlass(clipBorderRadius: BorderRadius.circular(16)),
    );
  }
}
