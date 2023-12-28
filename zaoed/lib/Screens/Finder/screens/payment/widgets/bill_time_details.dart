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
          style: TextStyle(fontSize: 12, color: AppColors().black),
        ),
        Text(
          'Dec 01 ,',
          style: TextStyle(fontSize: 12, color: AppColors().black),
        ),
        Text(
          '2023 .',
          style: TextStyle(fontSize: 12, color: AppColors().black),
        ),
        Text(
          '01:00:00',
          style: TextStyle(fontSize: 12, color: AppColors().black),
        ),
      ],
    );
  }
}
