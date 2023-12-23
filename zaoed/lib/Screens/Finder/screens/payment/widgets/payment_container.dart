import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class PaymentContainer extends StatelessWidget {
  const PaymentContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        width: 350,
        decoration: BoxDecoration(
            color: AppColors().gray6, borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Row(
              children: [
                Image.asset('lib/assets/icons/logos_mastercard.png'),
                const SizedBox(
                  width: 8,
                ),
                Text('Alinma Bank',
                    style: TextStyle(fontSize: 12, color: AppColors().white)),
                const SizedBox(
                  width: 4,
                ),
                Text('**** **** **** 11069',
                    style: TextStyle(fontSize: 12, color: AppColors().white)),
                const Spacer(),
                CircleAvatar(
                  maxRadius: 10,
                  minRadius: 10,
                  backgroundColor: AppColors().green,
                  child: const Icon(
                    Icons.check,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: AppColors().gray9,
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Row(
                children: [
                  Text(
                    'إضافة طريقة دفع أخرى',
                    style: TextStyle(fontSize: 18, color: AppColors().white),
                  ),
                  const Spacer(),
                  Image.asset('lib/assets/icons/small-left-solid.png')
                ],
              ),
            ),
          ),
        ]));
  }
}
