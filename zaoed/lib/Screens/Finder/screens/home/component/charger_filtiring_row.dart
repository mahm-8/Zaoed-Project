import 'package:flutter/material.dart';

import 'chargers_widget.dart';

class ChargerFiltiringRow extends StatelessWidget {
  const ChargerFiltiringRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChargersWidget(
              imageAsset: 'lib/assets/icons/GB.png',
              name: 'GB/T AC',
            ),
            ChargersWidget(
              imageAsset: 'lib/assets/icons/Type 2.png',
              name: 'Type 2',
            ),
            ChargersWidget(
              imageAsset: 'lib/assets/icons/Tesla.png',
              name: 'Tesla',
            ),
            ChargersWidget(
              imageAsset: 'lib/assets/icons/Type 1.png',
              name: 'Type 1',
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChargersWidget(
              imageAsset: 'lib/assets/icons/T DC.png',
              name: 'GB/T DC',
            ),
            ChargersWidget(
              imageAsset: 'lib/assets/icons/CCS 2.png',
              name: 'CCS 2',
            ),
            ChargersWidget(
              imageAsset: 'lib/assets/icons/Chademo.png',
              name: 'chademo',
            ),
            ChargersWidget(
              imageAsset: 'lib/assets/icons/CCS 1.png',
              name: 'CCS 1',
            ),
          ],
        ),
      ],
    );
  }
}
