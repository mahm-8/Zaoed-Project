import 'package:zaoed/constants/imports.dart';

class ScanBarcode extends StatelessWidget {
  const ScanBarcode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "امسح الباركود",
      style: const TextStyle().appBarTitlestyle,
    );
  }
}
