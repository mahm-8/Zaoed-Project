import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/bookmark_dialogs/add_bookmark_dialog.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/bookmark_dialogs/remove_bookmark_dialog.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/book_charge_button.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/chargers_row_widget.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/share_button_widget.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/colors.dart';

class BookmarkCardWidget extends StatelessWidget {
  const BookmarkCardWidget({
    super.key,
    required this.pointName,
    required this.pointLocation,
    required this.chargingPort,
    
    required this.rating,
    required this.chargingTimes,
    required this.portCount,
    required this.bookmarkID,
  });

  final String? pointName, pointLocation, chargingPort;
  final double? rating;
  final int? chargingTimes, portCount, bookmarkID;

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
                    pointName ?? "",
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
                    "$rating",
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
                    AddToBookmarkDialog(
                      pointName: pointName,
                      pointLocation: pointLocation,
                      chargingPort: chargingPort,
                   
                      rating: rating,
                      chargingTimes: chargingTimes,
                      portCount: portCount,
                      idBookmark: bookmarkID,
                    ),
                  if (isBookmarked == true)
                    RemoveBookMarkDialog(
                      bookmarkID: bookmarkID,
                    ),
                ],
              ),
              Text(
                pointLocation ?? "",
                style: TextStyle(
                    color: AppColors().gray4,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "SfArabic"),
              ),
              const SizedBox(
                height: 30,
              ),
              ChargersRowWidget(
                portCount: portCount,
                chargingPort: chargingPort,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShareButtonWidget(
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
