import 'package:intl/intl.dart';
import 'package:zaoed/constants/imports.dart';

class BillTimeDetails extends StatelessWidget {
  const BillTimeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat.yMMMd().format(now);
    String formattedTime = DateFormat.Hms().format(now);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$formattedDate ,',
          style: const TextStyle().style26,
        ),
        Text(
          formattedTime,
          style: const TextStyle().style26,
        ),
      ],
    );
  }
}
