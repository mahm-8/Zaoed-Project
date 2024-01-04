import 'package:zaoed/constants/imports.dart';

class BillTimeDetails extends StatelessWidget {
  const BillTimeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Wed ,',
          style: const TextStyle().style26,
        ),
        Text(
          'Dec 01 ,',
          style: const TextStyle().style26,
        ),
        Text(
          '2023 .',
          style: const TextStyle().style26,
        ),
        Text(
          '01:00:00',
          style: const TextStyle().style26,
        ),
      ],
    );
  }
}
