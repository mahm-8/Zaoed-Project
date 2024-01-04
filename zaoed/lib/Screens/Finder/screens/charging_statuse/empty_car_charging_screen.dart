import 'package:zaoed/constants/imports.dart';

class EmptyChargingCarScreen extends StatelessWidget {
  const EmptyChargingCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const EmptyChargingCar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 151),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لا توجد عملية شحن للسيارة!',
                  style: const TextStyle().style25,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'للبدء في عملية شحن جديدة، يرجى البحث عن نقطة شحن',
                  style: TextStyle(
                    color: AppColors().gray,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
