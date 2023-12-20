import 'package:flutter/material.dart';
import 'package:zaoed/bookmark_screens/components/book_charge_button.dart';
import 'package:zaoed/bookmark_screens/components/chargers_row_widget.dart';
import 'package:zaoed/bookmark_screens/components/share_button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/providor_show_dialogs/components/dialog_widget.dart';

class BookmarkCardWidget extends StatelessWidget {
  const BookmarkCardWidget({
    super.key,
  });

  // final String name, location, rate,

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
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
                    "منزل إيلاف محمد",
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
                    "5.0",
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
                    "(150)",
                    style: TextStyle(
                        color: AppColors().gray4,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "SfArabic"),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      //remove from bookmark list
                      showDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return const DialogWidget(
                            title: "تنبيه!",
                            bodyText:
                                "سيتم إزالة نقطة الشحن من المحفوظات، هل أنت نوافق؟",
                            button1: 'موافق',
                            button2: 'إلغاء',
                          );
                        },
                      );

                      // add bookmark (not here)
                      // showDialog(
                      //   barrierColor: Colors.transparent,
                      //   context: context,
                      //   builder: (context) {
                      //     return const DialogWidget(
                      //       title: "تم الإضافة",
                      //       bodyText:
                      //           "تم إضافة نقطة الشحن إلى المحفوظات",
                      //       button1: 'المحفوظات',
                      //       button2: 'إغلاق',
                      //     );
                      //   },
                      // );
                    },
                    child: Image.asset("lib/assets/icons/bookmark-2.png"),
                  )
                ],
              ),
              Text(
                "حي النرجس، الرياض",
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
