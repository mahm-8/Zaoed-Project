import 'package:zaoed/constants/imports.dart';

class BookmarkCardWidget extends StatelessWidget {
  const BookmarkCardWidget({
    super.key,
    required this.name,
    required this.rate,
    required this.location,
    required this.chargingTimes,
    required this.idAuth,
  });

  final String? name, location, idAuth;
  final double? rate;
  final int? chargingTimes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: Container(
        height: 203,
        width: 350,
        decoration: BoxDecoration(
            color: AppColors().gray1Trans,
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                        color: AppColors().mainWhite,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        fontFamily: "SfArabic"),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset("lib/assets/icons/Star.png"),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "$rate",
                    style: TextStyle(
                        color: AppColors().mainWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "SfArabic"),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "$chargingTimes",
                    style: TextStyle(
                        color: AppColors().gray4,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "SfArabic"),
                  ),
                  const Spacer(),
                  if (isBookmarked == false)
                    // do not show it on bookmark screen
                    AddToBookmarkDialog(
                        name: name,
                        location: location,
                        rate: rate,
                        chargingTimes: chargingTimes,
                        idAuth: idAuth),
                  if (isBookmarked == true)
                    //show dialog to remove from bookmaeks screen
                    const RemoveBookMarkDialog(),
                ],
              ),
              Text(
                "$location",
                style: TextStyle(
                    color: AppColors().gray4,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "SfArabic"),
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
      ),
    );
  }
}
