import 'package:flutter/material.dart';

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
            child: Image.asset('lib/assets/images/circles background.png')),
        Align(
            alignment: Alignment.center,
            child: Image.asset('lib/assets/images/2021-tesla-model-x.png')),
        Positioned(
            right: -83,
            top: 15,
            child: Image.asset('lib/assets/images/charger.png'))
      ],
    );
  }
}
