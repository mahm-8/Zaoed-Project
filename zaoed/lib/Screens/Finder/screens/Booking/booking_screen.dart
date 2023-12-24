import 'package:flutter/material.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/booking_confirmation_screen.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/widgets/charging_time.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/widgets/charging_type_row.dart';
import 'package:zaoed/Screens/Finder/screens/payment/widgets/title_label.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/profail_screens_app_bar.dart';

import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/components/sheet_method/rating_boottom_sheet.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  final List hours = [
    'ساعة',
    "ساعتان",
    "3 ساعات",
    "4 ساعات",
    "5 ساعات",
    "6 ساعات",
    "8 ساعات"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ProfileScreenAppBar(context, title: 'الحجز'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleLabel(
              title: 'المنفذ',
            ),
            const ChargingTypeRow(),
            const TitleLabel(
              title: 'مدة الشحن',
            ),
            ChargingTime(hours: hours),
            const SizedBox(
              height: 16,
            ),
            Text(
              '*تنبيه، سيتم حجز الموصل لمدة 10 دقائق وفي حال لم يتم إتمام عملية الحجز خلال هذه المدة سيتم إلغاء الحجز',
              style: TextStyle(fontSize: 12, color: AppColors().white),
            ),
            const Spacer(),
            ButtonWidget(
                textEntry: 'التالي',
                backColor: AppColors().green,
                onPress: () {
                  RaitingBottomSheet(context);
                  // context.push(view: const BookingConfirmationScreen());
                },
                textColor: AppColors().white)
          ],
        ),
      ),
    );
  }
}
