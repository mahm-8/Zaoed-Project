import 'package:flutter/material.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';

class EmptyCarScreen extends StatelessWidget {
  const EmptyCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 151),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'لا يوجد لديك مركبة لعرضها!',
            style: TextStyle(color: AppColors().gray, fontSize: 18),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'لعرض تفاصيل شحن السيارة، يرجى إضافة بيانات المركبة',
            style: TextStyle(
              color: AppColors().gray,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
              textEntry: 'إضافة مركبة',
              backColor: AppColors().green,
              onPress: () {},
              textColor: AppColors().black)
        ],
      ),
    );
  }
}
