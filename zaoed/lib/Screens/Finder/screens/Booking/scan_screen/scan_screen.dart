
import 'package:zaoed/constants/imports.dart';

class ScanBarcodeScreen extends StatelessWidget {
  const ScanBarcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Stack(children: [
          // camera background
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // show scan barcode then scaning barcode screen
              //ScanBarcode()
              ScaningBarcode(),
            ],
          ),
        ]),
      ),
    );
  }
}
