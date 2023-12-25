import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/bookmark_dialogs/add_bookmark_dialog.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/bookmark_dialogs/remove_bookmark_dialog.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/book_charge_button.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/chargers_row_widget.dart';
import 'package:zaoed/Screens/Finder/screens/bookmark_screens/components/share_button_widget.dart';
import 'package:zaoed/constants/colors.dart';


class ChargePointsCard extends StatelessWidget {
  const ChargePointsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 206,
      width: 355,
      blur: 4,
      color: AppColors().gray1Trans,
      border: Border(
          left: BorderSide(color: AppColors().green, width: 0.4),
          top: BorderSide(color: AppColors().green, width: 0.4)),
      shadowStrength: 5,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "منزل إيلاف محمد",
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
                  "5.0",
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
                  "(150)",
                  style: TextStyle(
                    color: AppColors().gray4,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (isBookmarked == false) const AddToBookmarkDialog(),
                if (isBookmarked == true) const RemoveBookMarkDialog(),
              ],
            ),
            Text(
              "حي النرجس، الرياض",
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
    );
  }
}
