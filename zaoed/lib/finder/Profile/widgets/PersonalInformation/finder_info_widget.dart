import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/finder/Profile/screens/ScreensWidgets/information_screen.dart';
import 'package:zaoed/finder/Profile/screens/car_screen.dart';
import 'package:zaoed/finder/Profile/widgets/information_lable.dart';

class FinderInfoWidget extends StatelessWidget {
  const FinderInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(children: [
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/person1.png',
          title: 'البيانات الشخصية',
          onTap: () {
            context.push(view: InformationScreen());
          },
        ),
        Divider(
          color: AppColors().black,
        ),
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/bolt.car.png',
          title: ' بيانات السيارة',
          onTap: () {
            context.push(view: CarScreen());
          },
        ),
      ]),
    );
  }
}
