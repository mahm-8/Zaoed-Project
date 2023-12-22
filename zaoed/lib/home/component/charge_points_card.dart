import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:zaoed/bookmark_screens/components/book_charge_button.dart';
import 'package:zaoed/bookmark_screens/components/chargers_row_widget.dart';
import 'package:zaoed/bookmark_screens/components/share_button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/providor_show_dialogs/components/added_dialog.dart';
import 'package:zaoed/providor_show_dialogs/components/dialog_widget.dart';
import 'package:zaoed/providor_show_dialogs/delete_dialogs/delete_done.dart';

import '../../providor_show_dialogs/components/state_dialog.dart';

class ChargePointsCard extends StatefulWidget {
  ChargePointsCard({
    super.key,
  });

  @override
  State<ChargePointsCard> createState() => _ChargePointsCardState();
}

class _ChargePointsCardState extends State<ChargePointsCard> {
  bool isBookmarked = false;

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
                if (isBookmarked == false)
                  InkWell(
                    onTap: () {
                      // add to bookmark list
                      //show dialog added
                      showDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return DialogWidget(
                            title: "إضافة إلى المحفوظات",
                            bodyText:
                                "سيتم إضافة نقطة الشحن إلى المحفوظات هل أنت موافق؟",
                            button1: 'موافق',
                            pressOne: () {
                              Navigator.of(context).pop();
                              showDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return const StateDialog(
                                    title: "تمت عملية الإضافة بنجاح",
                                  );
                                },
                              );
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.of(context).pop();
                              });
                              setState(() {
                                isBookmarked = true;
                              });
                            },
                            button2: 'إلغاء',
                            pressTwo: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    },
                    child: Image.asset("lib/assets/icons/not_bookmarked.png"),
                  ),
                if (isBookmarked == true)
                  InkWell(
                    onTap: () {
                      // remove from the bookmark list
                      // show dialog removed
                      showDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return DialogWidget(
                            title: "تنبية!",
                            bodyText:
                                "سيتم إزالة نقطة الشحن من المحفوظات، هل أنت موافق؟",
                            button1: 'موافق',
                            pressOne: () {
                              Navigator.of(context).pop();

                              showDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return const StateDialog(
                                    title: "تمت عملية الحذف بنجاح",
                                  );
                                },
                              );
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.of(context)
                                    .pop(); // Dismiss the dialog
                              });

                              setState(() {
                                isBookmarked = false;
                              });
                            },
                            button2: 'إلغاء',
                            pressTwo: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    },
                    child: Image.asset("lib/assets/icons/bookmarked.png"),
                  )
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
