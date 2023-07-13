import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/qrcode.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/rout_name.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  final box = GetStorage();
  QRCODEController c = Get.put(QRCODEController());
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    Map data = box.read("dataUser") as Map<String, dynamic>;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  (result != null)
                      ? FutureBuilder(
                          future: c.inputqrcode(
                              data["nim"], result!.code.toString()),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return (snapshot.data["error"] != true)
                                  ? TextButton(
                                      onPressed: () {
                                        Get.snackbar(
                                            'Hi', snapshot.data['pesan']);
                                        Get.offAllNamed(RoutName.root);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.blue, width: 1)),
                                        child: Text("Klik Untuk Absensi",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 15.sp)),
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () {
                                        Get.snackbar(
                                            'Hi', snapshot.data['error_msg']);
                                        Get.offAllNamed(RoutName.root);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(12.sp),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.sp),
                                            border: Border.all(
                                                color: Colors.blue, width: 1)),
                                        child: Text("Klik Untuk Absensi",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 15.sp)),
                                      ),
                                    );
                            } else {
                              return Text("Coba lagi",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15.sp));
                            }
                          },
                        )
                      // ? FutureBuilder(
                      //     future: c.inputqrcode(
                      //         data["nim"], result!.code.toString()),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasData) {
                      //         return Text("Data Diterima");
                      //       } else {
                      //         return Text("Data ditolak");
                      //       }
                      //     },
                      //   )
                      : Text(
                          'Scan a code',
                          style: TextStyle(color: Colors.blue, fontSize: 15.sp),
                        ),
                  Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              return IconButton(
                                onPressed: () async {
                                  await controller?.toggleFlash();
                                  setState(() {});
                                },
                                icon: (snapshot.data == false)
                                    ? const Icon(
                                        Icons.flash_off,
                                        color: Colors.blue,
                                      )
                                    : const Icon(Icons.flash_on,
                                        color: Colors.blue),
                                iconSize: 30.sp,
                              );
                            }),
                        FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              return IconButton(
                                onPressed: () async {
                                  await controller?.flipCamera();
                                  setState(() {});
                                },
                                icon: (snapshot.data == false)
                                    ? const Icon(
                                        Icons.cameraswitch_outlined,
                                        color: Colors.blue,
                                      )
                                    : const Icon(Icons.cameraswitch,
                                        color: Colors.blue),
                                iconSize: 30.sp,
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
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
