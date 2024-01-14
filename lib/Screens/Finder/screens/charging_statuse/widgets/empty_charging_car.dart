
import 'package:zaoed/constants/imports.dart';

class EmptyChargingCar extends StatelessWidget {
  const EmptyChargingCar({super.key});

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
        Positioned(top: 60, child: Image.asset('lib/assets/images/charger.png'))
      ],
    );
  }
}
