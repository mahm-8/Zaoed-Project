
import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/finder/screens/payment/widgets/bill_label.dart';
import 'package:zaoed/finder/screens/payment/widgets/bill_time_details.dart';
import 'package:zaoed/finder/screens/payment/widgets/bill_token.dart';

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 516,
        width: 270,
        color: AppColors().white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/icons/Group 31778.png'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: BillTimeDetails(),
              ),
              const BillToken(),
              const BillLabel(
                title: 'Token Type',
                subTitle: 'Visa Credit',
              ),
              const Divider(
                thickness: 1,
              ),
              const BillLabel(
                title: 'Customer Name',
                subTitle: 'Salwa Ibrahim',
              ),
              const BillLabel(
                title: 'Charger Type',
                subTitle: 'Tesla',
              ),
              const BillLabel(
                title: 'Address',
                subTitle: '13453 Riyadh St.Narjis',
              ),
              const Divider(
                thickness: 1,
              ),
              const BillLabel(
                title: 'Amount',
                subTitle: '57.00 SAR',
              ),
              const BillLabel(
                title: 'Tax',
                subTitle: '00.00 SAR',
              ),
              const BillLabel(
                title: 'Total',
                subTitle: '57.00 SAR',
              ),
              const Divider(
                thickness: 1,
              ),
              const BillLabel(
                title: 'Provider',
                subTitle: 'Ali Mohammed',
              )
            ],
          ),
        ),
      ),
    );
  }
}