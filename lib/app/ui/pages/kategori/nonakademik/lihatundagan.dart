// ignore_for_file: use_build_context_synchronously

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/ui/theme/color.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sn_progress_dialog/progress_dialog.dart';

class LihatUndanganPage extends StatefulWidget {
  @override
  State<LihatUndanganPage> createState() => _LihatUndanganPageState();
}

class _LihatUndanganPageState extends State<LihatUndanganPage> {
  var pathurl = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Preview",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: DataColors.primary700),
        ),
        backgroundColor: DataColors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: DataColors.primary700,
                ));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: PDFView(
            filePath: pathurl[0],
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: false,
            onRender: (_pages) {
              setState(() {});
            },
          )),
          Padding(
            padding: EdgeInsets.only(bottom: 100.sp, top: 10.sp),
            child: InkWell(
              onTap: () async {
                ProgressDialog pd = ProgressDialog(context: context);
                  final directory = await getTemporaryDirectory();
                  // String fileName = path.basename(pathurl[0]);
                  downloadFile(Dio(), pathurl[1], directory.path, pd);
                  pd.show(max: 100, msg: 'File Downloading...');
                // if (Platform.isAndroid) {
                //   AndroidDeviceInfo androidInfo =
                //       await DeviceInfoPlugin().androidInfo;
                //   if (int.parse(androidInfo.version.release.split('.')[0]) >=
                //       10) {
                //     await _requestStoragePermission(context);
                //     var status = await Permission.manageExternalStorage.status;
                //     if (status.isGranted) {
                //       ProgressDialog pd = ProgressDialog(context: context);
                //       final directory = await getTemporaryDirectory();
                //       // String fileName = path.basename(pathurl[0]);
                //       downloadFile(Dio(), pathurl[1], directory.path, pd);
                //       pd.show(max: 100, msg: 'File Downloading...');
                //     } else {
                //       Get.snackbar("Hi", "Anda Belum Memberikan Izin Akses Penyimpanan");
                //     }
                //   }
                // } else {
                //   ProgressDialog pd = ProgressDialog(context: context);
                //   final directory = await getTemporaryDirectory();
                //   // String fileName = path.basename(pathurl[0]);
                //   downloadFile(Dio(), pathurl[1], directory.path, pd);
                //   pd.show(max: 100, msg: 'File Downloading...');
                // }
              },
              child: Container(
                  padding: EdgeInsets.all(0.sp),
                  height: 30.sp,
                  width: 80.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: DataColors.primary700),
                  child: Center(
                    child: Text(
                      "Unduh PDF",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: DataColors.white),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  // Future<File> downloadFile(String url, String fileName) async {
  //   var httpClient = http.Client();
  //   var req = await httpClient.get(Uri.parse(url));
  //   var bytes = req.bodyBytes;
  //   if (Platform.isAndroid && Platform.version.startsWith('11')) {
  //     // Use SAF for Android 11 and above
  //     bool isPermissionGranted =
  //         await Permission.manageExternalStorage.isGranted;
  //     if (!isPermissionGranted) {
  //       // Request permission if not granted
  //       var status = await Permission.manageExternalStorage.request();
  //       if (!status.isGranted) {
  //         throw Exception("Izin akses penyimpanan eksternal tidak diberikan.");
  //       }
  //     }
  //     String savePath = "/storage/emulated/0/Download";
  //     Directory? externalDir = await getExternalStorageDirectory();
  //     if (externalDir == null) {
  //       throw Exception("Gagal mendapatkan direktori penyimpanan eksternal");
  //     }
  //     File file = File('$savePath/$fileName');
  //     await file.writeAsBytes(bytes);
  //     Get.snackbar("Hi", "Berhasil");
  //     return file;
  //   } else {
  //     String savePath = "/storage/emulated/0/Download";
  //     // Use getExternalStorageDirectory() for Android below 11
  //     Directory? externalDir = await getExternalStorageDirectory();
  //     if (externalDir == null) {
  //       throw Exception("Gagal mendapatkan direktori penyimpanan eksternal");
  //     }

  //     File file = File('$savePath/$fileName');
  //     int fileSuffix = 1;
  //     while (file.existsSync()) {
  //       // Jika file sudah ada, tambahkan angka unik ke nama file
  //       file = File('$savePath/${fileName}_${fileSuffix++}');
  //     }
  //     await file.writeAsBytes(bytes);
  //     Get.snackbar("Hi", "Berhasil");
  //     return file;
  //   }
  // }
  Future downloadFile(
      Dio dio, String url, String place, ProgressDialog pd) async {
    // DateTime now = DateTime.now();
    // String formatdate = DateFormat('EEE d MMM kk-mm-ss').format(now);
    String savename = path.basename(pathurl[0]);
    String savePath = "/storage/emulated/0/Download" + "/$savename";
  
    try {
      // int fileSuffix = 1;
      //   while (File(savePath).existsSync()) {
      //     int extensionIndex = fileName.lastIndexOf('.');
      //     String fileNameWithoutExtension = extensionIndex != -1
      //         ? fileName.substring(0, extensionIndex)
      //         : fileName;
      //     String fileExtension =
      //         extensionIndex != -1 ? fileName.substring(extensionIndex) : '';
      //     savePath =
      //         '$savePath/${fileNameWithoutExtension}_$fileSuffix$fileExtension';
      //     fileSuffix++;
      // }
      await Dio().download(url, savePath, onReceiveProgress: (received, total) {
        int progress = (((received / total) * 100).toInt());
        pd.update(value: progress);
        if (total != -1) {
          //you can build progressbar feature too
        }
      });

      pd.close();
      Get.snackbar('Success', 'File disimpan di folder download');
    } on DioError catch (e) {}
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      directory = Directory('/storage/emulated/0/Download');
    } catch (err) {}
    return directory?.path;
  }

  
}
