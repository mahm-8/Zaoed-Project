import 'package:zaoed/constants/imports.dart';

class ChargingStatuesScreen extends StatefulWidget {
  const ChargingStatuesScreen({super.key});

  @override
  _ChargingStatuesScreenState createState() => _ChargingStatuesScreenState();
}

class _ChargingStatuesScreenState extends State<ChargingStatuesScreen> {
  double remainingTime = 100;
  double completedPercentage = 50;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timerToCompleted();
  }

  timerToCompleted() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
          completedPercentage += 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ChargingAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ChargingCar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                    child: TimerWidget(
                        remainingTime: remainingTime,
                        completedPercentage: completedPercentage),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
