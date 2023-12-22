import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class AvailabilityHours extends StatelessWidget {
  AvailabilityHours({
    super.key,
  });
  List textClock = [
    'غير متوفر',
    '00:00-6:00',
    '6:00-12:00',
    '12:00-18:00',
    '18:00-00:00'
  ];
  List imageClock = [
    'lib/assets/icons/Clock_.png',
    'lib/assets/icons/ClockFri12-6.png',
    'lib/assets/icons/ClockFri6-12.png',
    'lib/assets/icons/ClockFri6-12.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ساعات توفر الخدمة',
            style: TextStyle(color: AppColors().white, fontSize: 20),
          ),
          Divider(
            thickness: 1,
            color: AppColors().gray6,
          ),
          Row(
            children: [
              SizedBox(
                width: 320,
                height: 86,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: AppColors().gray6)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Image.asset(
                              imageClock[index],
                            ),
                            const Spacer(),
                            Text(textClock[index],
                                style: TextStyle(
                                    color: AppColors().white, fontSize: 12))
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 12,
                    );
                  },
                  itemCount: imageClock.length,
                ),
              ),
              Image.asset(
                'lib/assets/icons/small-left-solid.png'
              )
            ],
          ),
          Divider(
            thickness: 1,
            color: AppColors().gray6,
          ),
        ],
      ),
    );
  }
}
