import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/daily_hours_rate_chart_container.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/ScreensWidgets/daily_profit_rate_chart_container.dart';

import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StaticBloc>().add(CalculateDailyProfit());
    final staticbloc = context.read<StaticBloc>();
    context.read<StaticBloc>().add(HourStaticEvent());
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
                  subTitle: '${staticbloc.amountTotal?[7] ?? 0.0} ريال',
                  dataProfitRate: staticbloc.amountTotal,
                ).asGlass(
                    tintColor: AppColors().gray1,
                    clipBorderRadius: BorderRadius.circular(8)),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<StaticBloc, StaticState>(
                  builder: (context, state) {
                    if (state is StaticHourState) {
                      return DailyHoursRateChartContainer(
                        title: 'معدل الساعات اليومية',
                        subTitle: '${state.totalToday} ساعات',
                      );
                    }
                    return const DailyHoursRateChartContainer(
                      title: 'معدل الساعات اليومية',
                      subTitle: '0 ساعات 0 دقيقة',
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
