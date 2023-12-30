import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:zaoed/constants/imports.dart';

class ScanBarcodeScreen extends StatefulWidget {
  const ScanBarcodeScreen({super.key});

  @override
  State<ScanBarcodeScreen> createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends State<ScanBarcodeScreen> {
  late QRViewController qrController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  String? result;
  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    // add this to bloc
    bool isScanned = false;
    setState(() {
      qrController = controller;
      qrController.scannedDataStream.listen((event) {
        result = event.code.toString();
        qrController.stopCamera();
        // qr code match
        if (event.toString() == "qr code url" && isScanned == false) {
          // emit ScaningSucessState
          //show dialog
          // navigate to screen
        }
        // qr code not valid
        if (event.toString() == "qr code url" && isScanned == true) {
          // emit ScaningInvalidState
          //show dialog
        }
        // qr code not found
        if (event.toString() != "qr code url") {
          // emit ScaningNotFoundState

          //show dialog
        }

        print("event ${event.toString()}");
        // event code print the url of the scanned
        print("event code ${event.code.toString()}");
        print("event format ${event.format.toString()}");
        print("event rawwwwwwwwwww ${event.rawBytes}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  cutOutSize: 300,
                  borderLength: 60,
                  borderWidth: 15,
                  borderColor: AppColors().green),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text('Barcode Type: $result')
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }
}
