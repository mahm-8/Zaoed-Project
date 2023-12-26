
import 'package:zaoed/constants/imports.dart';

class ChargingCarFinished extends StatelessWidget {
  const ChargingCarFinished({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              'lib/assets/images/circles background.png',
              color: AppColors().gray,
            )),
        Align(
            alignment: Alignment.center,
            child: Image.asset('lib/assets/images/2021-tesla-model-x.png')),
        Positioned(top: 60, child: Image.asset('lib/assets/images/charger.png'))
      ],
    );
  }
}
