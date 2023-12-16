import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/information_lable.dart';
import 'package:zaoed/constants/colors.dart';

class ProviderInformation extends StatelessWidget {
  const ProviderInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        InformationLabel(
          imageIcon: 'lib/assets/icons/person1.png',
          title: 'البيانات الشخصية',
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/Vector 3.png',
          title: 'بيانات نقطة الشحن',
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/statices1.png',
          title: 'الأحصائيات',
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
        ),
        InformationLabel(
          imageIcon: 'lib/assets/icons/bolt.car.png',
          title: 'بيانات السيارة',
          onTap: () {},
        ),
      ]),
    );
  }
}
