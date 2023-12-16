import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/bank_information.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/information_lable.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

class PaymentInformation extends StatelessWidget {
  const PaymentInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InformationLabel(
          imageIcon: 'lib/assets/icons/akar-icons_credit-card.png',
          title: 'البطاقات',
          onTap: () {},
        ),
         Divider(
        thickness: 1,color: AppColors().gray9,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/Card.png',
          title: 'البيانات البنكية',
          onTap: () {
            context.push(view: BankInformationScreen());
          },
        ),
         Divider(
           thickness: 1,color: AppColors().gray9,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/Bill.png',
          title: 'سجل عمليات الدفع',
          onTap: () {},
        ),
      ]),
    );
  }
}
