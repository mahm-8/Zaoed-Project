import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';

int index1 = 0;

class AvailabilityHours extends StatelessWidget {
  AvailabilityHours(
      {super.key,
      required this.bloc,
      required this.initialSelectedHour,
      required this.isEdit});

  final ProviderBloc bloc;
  final String? initialSelectedHour;
  final bool isEdit;

  List<String> imageClock = [
    'lib/assets/icons/Clock_.png',
    'lib/assets/icons/ClockFri12-6.png',
    'lib/assets/icons/ClockFri6-12.png',
    'lib/assets/icons/ClockFri6-12.png'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderBloc, ProviderState>(
      builder: (context, state) {
        final selectedIndex =
            state is HoursIndexSelectedState ? state.selectedIndex : -1;
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
                    width: context.getWidth(divide: 1.3),
                    height: 86,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        selectHourMethod(initialSelectedHour, index);
                        index1 = index;
                        return GestureDetector(
                          onTap: () {
                            bloc.add(HoursSelectIndexEvent(index));

                            print(index);
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                // change color based on index in supabase
                                color: selectedIndex == index
                                    ? AppColors().green
                                    : selectedIndex != index
                                        ? AppColors().gray6
                                        : AppColors().green,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  Image.asset(imageClock[index]),
                                  const Spacer(),
                                  Text(
                                    bloc.textClock[index],
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? AppColors().green
                                          : selectedIndex != index
                                              ? AppColors().white
                                              : AppColors().green,
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
      },
    );
  }

  int selectHourMethod(String? initialSelectedHour, int index) {
    switch (initialSelectedHour) {
      case 'غير متوفر':
        bloc.selectedHour = bloc.textClock[index];
        return 0;
      case '00:00-6:00':
        bloc.selectedHour = bloc.textClock[index];
        return 1;
      case '6:00-12:00':
        bloc.selectedHour = bloc.textClock[index];
        return 2;
      case '12:00-18:00':
        bloc.selectedHour = bloc.textClock[index];
        return 3;
      case '18:00-00:00':
        bloc.selectedHour = bloc.textClock[index];
        return 4;
      default:
        bloc.selectedHour = bloc.textClock[0]; // Default to the first item
        return 0;
    }
  }
}
