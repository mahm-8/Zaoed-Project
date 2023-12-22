import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/charging_point_data.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/personal_information.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/statics_screen.dart';
import 'package:zaoed/Provider/Screens/Profile/widgets/information_lable.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';

class ProviderInformation extends StatelessWidget {
  const ProviderInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InformationLabel(
              imageIcon: 'lib/assets/icons/person1.png',
              title: 'البيانات الشخصية',
              onTap: () {
                context.push(view: PersonalInformationScreen());
              },
            ),
            Divider(
              thickness: 1,
              color: AppColors().gray9,
            ),
            InformationLabel(
              imageIcon: 'lib/assets/icons/Vector 3.png',
              title: 'بيانات نقطة الشحن',
              onTap: () {
                context.push(view: const ChargingPointDataScreen());
              },
            ),
            Divider(
              thickness: 1,
              color: AppColors().gray9,
            ),
            InformationLabel(
              imageIcon: 'lib/assets/icons/prime_chart-bar.png',
              title: 'الأحصائيات',
              onTap: () {
                context.push(view: const StaticsScreen());
              },
            ),
            Divider(
              thickness: 1,
              color: AppColors().gray9,
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
