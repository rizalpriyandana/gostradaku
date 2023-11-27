import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';



class Kunjungan extends StatefulWidget {
  @override
  State<Kunjungan> createState() => _KunjunganState();
}

class _KunjunganState extends State<Kunjungan> {
  final box = GetStorage();
  String nisn = "";
  final data = Get.arguments;
  int counter = 0;
  // QRController cqr = Get.find<QRController>();
  // DashboardController dc = Get.find<DashboardController>();
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
   
 
    return Scaffold(
      body: Stack(
        children: [
          _buildQrView(context),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderLength: 30.sp,
        borderWidth: 10.sp,
        borderRadius: 10.sp,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      if (counter < 1 ) {
        setState(() {
          result = scanData;
          // cqr.vis = true;
          // resultscan = scanData;
        });
        Get.back();
        Get.snackbar("Go-Strada", "Anda Berhasil Berkunjung");
      } 
     counter++;
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    } else {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}