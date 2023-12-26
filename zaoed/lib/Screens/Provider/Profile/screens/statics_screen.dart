import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass/glass.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/daily_hours_rate_chart_container.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/daily_profit_rate_chart_container.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StaticBloc>().add(HourStaticEvent());
    final dailyhour = context.read<StaticBloc>();
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'الاحصائيات'),
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/MAP.png',
            width: context.getWidth(),
            height: context.getHeight(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                DailyProfitRateChartContainer(
                  title: 'معدل الربح اليومي',
                  subTitle: '50 ريال',
                ).asGlass(
                    tintColor: AppColors().gray1,
                    clipBorderRadius: BorderRadius.circular(8)),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<StaticBloc, StaticState>(
                  builder: (context, state) {
                    print(dailyhour.dailyHour);
                    if (state is StaticHourState) {
                      return DailyHoursRateChartContainer(
                        title: 'معدل الساعات اليومية',
                        subTitle: 'ساعات ${state.totalToday}',
                      );
                    }
                    return DailyHoursRateChartContainer(
                      title: 'معدل الساعات اليومية',
                      subTitle: '10 ساعات 28 دقيقة',
                    );
                  },
                ).asGlass(
                    tintColor: AppColors().gray1,
                    clipBorderRadius: BorderRadius.circular(8))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
