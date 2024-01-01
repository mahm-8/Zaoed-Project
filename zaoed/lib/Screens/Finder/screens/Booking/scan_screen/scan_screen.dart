import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/scan_screen/components/scan_barcode.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/scan_screen/components/scaning_dialogs/fisrt_scan_dialog.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/scan_screen/components/scaning_dialogs/invalid_barcode_dialog.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class ScanBarcodeScreen extends StatefulWidget {
  ScanBarcodeScreen({super.key, required this.chargingPoint});
  final ChargingPoint chargingPoint;

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

  // @override

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
      final bookedUserId = widget.chargingPoint.pointAuthID;
      final bookedPointAuth = widget.chargingPoint.pointAuthID;
      final currentUserID = supabase.auth.currentUser?.id;
      // qr code match
      if (event.code.toString() == bookedPointAuth &&
          currentUserID == bookedUserId) {
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

      print("event ${event.toString()}");
      // event code print the url of the scanned
      print("event code ${event.code.toString()}");
      print("event format ${event.format.toString()}");
      print("event rawwwwwwwwwww ${event.rawBytes}");
    });
  }
}
