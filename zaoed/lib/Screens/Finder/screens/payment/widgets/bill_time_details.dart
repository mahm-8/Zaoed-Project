
import 'package:flutter/material.dart';

class BillTimeDetails extends StatelessWidget {
  const BillTimeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Wed ,',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          'Dec 01 ,',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '2023 .',
          style: TextStyle(fontSize: 12),
        ),
        Text(
          '01:00:00',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
