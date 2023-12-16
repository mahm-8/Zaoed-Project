import 'package:flutter/material.dart';
import 'package:zaoed/constants/colors.dart';

class AvailabilityHours extends StatelessWidget {
  const AvailabilityHours({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ساعات توفر الخدمة',
            style: TextStyle(color: AppColors().white, fontSize: 16),
          ),
          Divider(
            thickness: 1,
            color: AppColors().gray6,
          ),
          Row(
            children: [
              SizedBox(
                width: 320,
                height: 78,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: AppColors().gray6)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Image.asset(
                              'lib/assets/icons/Clock_.png',
                            ),
                            Spacer(),
                            Text('غير متوفر',
                                style: TextStyle(
                                    color: AppColors().white, fontSize: 12))
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 12,
                    );
                  },
                  itemCount: 7,
                ),
              ),
              Image.asset(
                'lib/assets/icons/small-left-solid.png',
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
