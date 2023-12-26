import 'package:zaoed/constants/imports.dart';

class BillToken extends StatelessWidget {
  const BillToken({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(style: BorderStyle.solid, color: Colors.black)),
      child: const Center(child: Text('0237-7746-8981-9028-5626')),
    );
  }
}
