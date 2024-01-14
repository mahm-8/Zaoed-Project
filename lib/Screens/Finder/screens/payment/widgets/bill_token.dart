import 'package:zaoed/constants/imports.dart';

class BillToken extends StatelessWidget {
  const BillToken({
    super.key,
    this.token,
  });
  final String? token;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(style: BorderStyle.solid, color: Colors.black)),
      child: Center(
          child: Text(
        token ?? "",
        style: TextStyle(color: AppColors().black),
      )),
    );
  }
}
