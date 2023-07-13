import 'dart:convert';
import 'dart:io';
import 'package:gostradav1/app/ui/pages/kategori/riwayat_bayar/detailtransaksi/pdfview.dart';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:gostradav1/app/data/models/test_m.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../data/models/riwayatbayar_m.dart';

class RiwayatBayarController extends GetxController {
  double progress = 0;
  List<UnduhBuktiModel> link = [];
  String? codepembayaran;
  List<RiwayatBayar> data = [];
  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      directory = Directory('/storage/emulated/0/Download');
    } catch (err) {}
    return directory?.path;
  }

  RB(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/keuangan/riwayat_pembayaran"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);

      //var test = jsonDecode(DataUser['data']);
      //print(test);

      // List list =
      //result2['data'].map((data) => DataModel.fromJson(data)).toList();
      // print(result2);
      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        data.clear();
        var result = RiwayatBayar.fromJson(databody);

        data.add(result);

        return result;
      }
    }
  }

  UnduhBuktiBayar(String? code) async {
    final Map<String, dynamic> dataBody = {
      UnduhBukti.code: code,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/keuangan/print_invc"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);

      //var test = jsonDecode(DataUser['data']);
      //print(test);

      // List list =
      //result2['data'].map((data) => DataModel.fromJson(data)).toList();
      // print(result2);
      if (databody['error'] == true) {
        //show error

      } else {
        var result = UnduhBuktiModel.fromJson(databody);
        // final taskId = await FlutterDownloader.enqueue(
        //   url: result.file,
        //   savedDir: '/storage/emulated/0/Download/',
        //   showNotification:
        //       true, // show download progress in status bar (for Android)
        //   openFileFromNotification:
        //       true, // click on notification to open downloaded file (for Android)
        // );
        link.clear();
        link.add(result);
      }
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future download(
      Dio dio, String? code, String place, ProgressDialog pd) async {
    final Map<String, dynamic> dataBody = {
      UnduhBukti.code: code,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/keuangan/print_invc"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      // print(DataUser['data']);

      //var test = jsonDecode(DataUser['data']);
      //print(test);

      // List list =
      //result2['data'].map((data) => DataModel.fromJson(data)).toList();
      // print(result2);
      if (databody['error'] == true) {
        //show error

      } else {
        var result = UnduhBuktiModel.fromJson(databody);

        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
          //add more permission to request here.
        ].request();

        if (statuses[Permission.storage]!.isGranted) {
          DateTime now = DateTime.now();
          String formatdate = DateFormat('EEE d MMM kk-mm-ss').format(now);
          String savename = "RiwayatBayar $formatdate.pdf";
          String savePath = "/storage/emulated/0/Download" + "/$savename";

          //output:  /storage/emulated/0/Download/banner.png

          try {
            await Dio().download(result.file, savePath,
                onReceiveProgress: (received, total) {
              int progress = (((received / total) * 100).toInt());
              pd.update(value: progress);
              if (total != -1) {
                //you can build progressbar feature too
              }
            });
            pd.close();
            Get.snackbar('Success', 'File is saved to download folder');
            Get.to(MyPage(), arguments: savePath);
          } on DioError catch (e) {}
        } else {
          Get.snackbar('Failed', 'No permission to read and write.');
        }
      }
    } else {
      Get.snackbar('Error', 'Server Tidak Merespon');
    }
  }
}
