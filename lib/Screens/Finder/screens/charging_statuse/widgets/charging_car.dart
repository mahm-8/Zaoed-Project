import 'package:lottie/lottie.dart';
import 'package:zaoed/constants/imports.dart';

class ChargingCar extends StatelessWidget {
  const ChargingCar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset('lib/assets/images/circles background.png')),
        Align(
            alignment: Alignment.center,
            child: Image.asset('lib/assets/images/2021-tesla-model-x.png')),
        Positioned(
            right: -83,
            top: 15,
            child: Lottie.asset('lib/assets/lottie/charging_animation.json'))
      ],
    );
  }
}
