import 'package:zaoed/constants/imports.dart';

class ChargingTime extends StatelessWidget {
  ChargingTime({super.key, required this.hours});

  final List hours;

  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
      buildWhen: (previous, current) {
        if (current is ChargingTimeState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is ChargingTimeState) {
          return SizedBox(
            height: 42,
            width: 350,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    context.read<PagesBloc>().add(ChargingTimeEvent(index));
                  },
                  child: Container(
                    width: 88,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: index == state.selected
                            ? AppColors().green
                            : AppColors().gray6,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        hours[index],
                        style: TextStyle(
                          color: index == state.selected
                              ? AppColors().green
                              : AppColors().white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemCount: hours.length,
            ),
          );
        }
        return SizedBox(
          height: 42,
          width: 350,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  context.read<PagesBloc>().add(ChargingTimeEvent(index));
                },
                child: Container(
                  width: 88,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: index == selectedIndex
                          ? AppColors().green
                          : AppColors().gray6,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      hours[index],
                      style: TextStyle(
                        color: index == selectedIndex
                            ? AppColors().green
                            : AppColors().white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
            itemCount: hours.length,
          ),
        );
      },
    );
  }
}
