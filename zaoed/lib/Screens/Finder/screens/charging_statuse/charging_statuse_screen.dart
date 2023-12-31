import 'package:zaoed/constants/imports.dart';

class ChargingStatuesScreen extends StatefulWidget {
  const ChargingStatuesScreen({super.key});

  @override
  _ChargingStatuesScreenState createState() => _ChargingStatuesScreenState();
}

class _ChargingStatuesScreenState extends State<ChargingStatuesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ChargingCar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CarInformation(),
                const SizedBox(
                  height: 8,
                ),
                const LocationInformation(),
                const SizedBox(
                  height: 16,
                ),
                const PriceInformation(),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors().gray6,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 350,
                  height: 150,
                  child: const TimerWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
