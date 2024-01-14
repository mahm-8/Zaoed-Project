
import 'package:zaoed/constants/imports.dart';

class ScanBarcodeScreen extends StatefulWidget {
  const ScanBarcodeScreen(
      {super.key, required this.chargingPoint, required this.carBooking});
  final ChargingPoint? chargingPoint;
  final CarBookingModel? carBooking;

  @override
  State<ScanBarcodeScreen> createState() => _ScanBarcodeScreenState();
}

class _ScanBarcodeScreenState extends State<ScanBarcodeScreen> {
  late QRViewController qrController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        QRView(
          key: _qrKey,
          onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
              cutOutSize: 300,
              borderLength: 60,
              borderWidth: 15,
              borderColor: AppColors().green),
        ),
        const Positioned(top: 200, right: 120, child: ScanBarcode()),
      ]),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    qrController.scannedDataStream.listen((event) {
      final bookedPointID = widget.chargingPoint?.pointId;
      if (event.code.toString() == bookedPointID.toString()) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ScanFirstDialog();
            });
        qrController.pauseCamera();
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const InvalidBarcodeDialog();
            });
        qrController.pauseCamera();
      }


    });
  }
}
