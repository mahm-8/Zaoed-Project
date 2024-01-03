import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/scan_screen/components/scan_barcode.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/scan_screen/components/scaning_dialogs/fisrt_scan_dialog.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/scan_screen/components/scaning_dialogs/invalid_barcode_dialog.dart';
import 'package:zaoed/constants/imports.dart';

class ScanBarcodeScreen extends StatefulWidget {
  ScanBarcodeScreen(
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

  // @override

  @override
  Widget build(BuildContext context) {
    // context.read<ChargingBloc>().add(GetUserBooking());
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
      final bookedUserId = widget.carBooking?.idAuth;
      final bookedPointID = widget.chargingPoint?.pointId;
      // final currentUserID = supabase.auth.currentUser?.id;
      // qr code match
      if (event.code.toString() == bookedPointID.toString()
          //  &&
          //     currentUserID == bookedUserId
          ) {
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

      print("------------------------");

      print(bookedUserId);

      if (event.code.toString() == bookedPointID.toString()) {
        print("=====================");
        print(event.code.toString());
        print(bookedPointID.toString());
        print("=====================");
      }

      print("event ${event.toString()}");
      // event code print the url of the scanned
      print("event code ${event.code.toString()}");
      print("event format ${event.format.toString()}");
      print("event rawwwwwwwwwww ${event.rawBytes}");
    });
  }
}


/**
 * 
 * 
  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    qrController.scannedDataStream.listen((event) {
      final bookedUserId = widget.carBooking?.idAuth;
      final bookedPointIDQR = widget.chargingPoint?.pointId;

      final currentUserID = supabase.auth.currentUser?.id;

      if (event.code.toString() == bookedPointIDQR &&
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
      print("point ID");

      print(bookedPointIDQR);
      print("current yser");
      print(currentUserID);
      print("user ID");

      print(bookedUserId);
      print("eventttttttttttttttttttttt");

      print("event ${event.toString()}");

      print("event ${event.toString()}");
      // event code print the url of the scanned
      print("event code ${event.code.toString()}");
      print("event format ${event.format.toString()}");
      print("event rawwwwwwwwwww ${event.rawBytes}");
    });
  }
 */