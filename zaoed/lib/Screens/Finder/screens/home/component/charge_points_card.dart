import 'package:zaoed/constants/imports.dart';

class ChargePointsCard extends StatefulWidget {
  const ChargePointsCard({
    super.key,
    this.bookmarks,
  });
  final BookmarkModel? bookmarks;

  @override
  State<ChargePointsCard> createState() => _ChargePointsCardState();
}

class _ChargePointsCardState extends State<ChargePointsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 62.0),
      child: Container(
        height: 206,
        width: MediaQuery.of(context).size.width,
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
                    "${widget.bookmarks?.bookmarkName}",
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
                    "${widget.bookmarks?.rating}",
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
                    "${widget.bookmarks?.chrgingTimes}",
                    style: TextStyle(
                      color: AppColors().gray4,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  if (isBookmarked == false)
                    AddToBookmarkDialog(
                      name: widget.bookmarks?.bookmarkName,
                      location: widget.bookmarks?.location,
                      idAuth: widget.bookmarks?.idAuth,
                      rate: widget.bookmarks?.rating,
                      chargingTimes: widget.bookmarks?.chrgingTimes,
                      id: widget.bookmarks?.id,
                    ),
                  if (isBookmarked == true)
                    RemoveBookMarkDialog(
                      bookmarkId: widget.bookmarks?.id,
                    ),
                ],
              ),
              Text(
                "${widget.bookmarks?.location}",
                style: TextStyle(
                  color: AppColors().gray4,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ChargersRowWidget(),
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
