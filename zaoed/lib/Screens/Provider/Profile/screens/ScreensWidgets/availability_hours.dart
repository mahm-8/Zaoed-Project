import 'package:zaoed/constants/imports.dart';

class AvailabilityHours extends StatefulWidget {
  const AvailabilityHours({super.key});

  @override
  State<AvailabilityHours> createState() => _AvailabilityHoursState();
}

class _AvailabilityHoursState extends State<AvailabilityHours> {
  late int selectedIndex = -1;

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
                    return GestureDetector(
                      onTap: () {
                        // bloc
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: selectedIndex == index
                                ? AppColors().green
                                : AppColors().gray6,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Image.asset(imageClock[index]),
                              const Spacer(),
                              Text(
                                textClock[index],
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? AppColors().green
                                      : AppColors().white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
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
              Image.asset('lib/assets/icons/small-left-solid.png')
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
