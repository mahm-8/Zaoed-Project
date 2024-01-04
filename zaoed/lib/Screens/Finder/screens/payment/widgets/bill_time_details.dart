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
          style: const TextStyle().style34,
        ),
        Text(
          'Dec 01 ,',
          style: const TextStyle().style34,
        ),
        Text(
          '2023 .',
          style: const TextStyle().style34,
        ),
        Text(
          '01:00:00',
          style: const TextStyle().style34,
        ),
      ],
    );
  }
}
