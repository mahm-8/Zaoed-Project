
import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/finder/screens/payment/widgets/booking_price_label.dart';

class BookingPriceContainer extends StatelessWidget {
  const BookingPriceContainer({
    super.key,
    required this.discount,
  });

  final int discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: 350,
      decoration: BoxDecoration(
          color: AppColors().gray6,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          BookingPriceLabel(
            title: 'السعر الفرعي',
            subTitle: '19.00 ريال',
          ),
          BookingPriceLabel(
            title: 'عدد ساعات الشحن',
            subTitle: '3 ساعات',
          ),
          BookingPriceLabel(
            title: 'الخصم (${discount})',
            subTitle: 'غير متوفر حاليا',
            isDiscount: true,
          ),
          Divider(
            thickness: 1,
            color: AppColors().gray9,
          ),
          BookingPriceLabel(
            title: 'المجموع (تتضمن الـ VAT)',
            subTitle: '57.00 ريال',
          )
        ],
      ),
    );
  }
}
