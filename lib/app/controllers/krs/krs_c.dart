import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/data/models/detailKhs_m.dart';
import 'package:gostradav1/app/data/models/masterkhs_m.dart';
import 'package:gostradav1/app/data/models/masterkrs_m.dart';
import 'package:gostradav1/app/data/models/transkipnilai_m.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../data/models/detailKrs_m.dart';
import '../../data/models/riwayatbayar_m.dart';
import '../../data/models/test_m.dart';
import 'package:gostradav1/app/ui/pages/kategori/riwayat_bayar/detailtransaksi/pdfview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class KrsController extends GetxController {
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;
  final String masterKRS =
      'https://siakad.strada.ac.id/mobile/Data/master_krs';
  masterkrs(String nim) async {
    final Map<String, dynamic> dataBody = {
      CodeVA.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/data/master_krs"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = MasterKrs.fromJson(databody);

        return result;
      }
    }
  }

  detailkrs(String nim, String semester) async {
    final Map<String, dynamic> dataBody = {
      GetSks.nim: nim,
      GetSks.semester: semester
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/data/detail_krs"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = DetailKrs.fromJson(databody);

        return result;
      }
    }
  }

  masterkhs(String nim) async {
    final Map<String, dynamic> dataBody = {
      CodeVA.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/data/master_khs"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = MasterKhsModel.fromJson(databody);

        return result;
      }
    }
  }

  detailkhs(String nim, String semester) async {
    final Map<String, dynamic> dataBody = {
      GetSks.nim: nim,
      GetSks.semester: semester
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/data/detail_khs"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = DetailKhsModel.fromJson(databody);

        return result;
      }
    }
  }

  transkipnilai(String nim) async {
    final Map<String, dynamic> dataBody = {
      GetSks.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/data/transkip"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = TranskipNilai.fromJson(databody);

        return result;
      }
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future downloadtranskip(
      Dio dio, String? nim, String place, ProgressDialog pd) async {
    final Map<String, dynamic> dataBody = {
      GetSks.nim: nim,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/data/download_transkip"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

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
          String savename = "Transkrip $formatdate.pdf";
          String savePath = "/storage/emulated/0/Download" + "/$savename";
          //output:  /storage/emulated/0/Download/banner.png
          pd.show(max: 100, msg: 'File Downloading...');
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
    } else {}
  }

  Future downloadkhs(Dio dio, String? nim, String? semester, String place,
      ProgressDialog pd) async {
    final Map<String, dynamic> dataBody = {
      GetSks.nim: nim,
      GetSks.semester: semester
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/data/download_khs"),
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
          String savename = "KHS $formatdate.pdf";
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

  Future downloadkrs(Dio dio, String? nim, String? semester, String place,
      ProgressDialog pd) async {
    final Map<String, dynamic> dataBody = {
      GetSks.nim: nim,
      GetSks.semester: semester
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/data/download_krs"),
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
          String savename = "KRS $formatdate.pdf";
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
  
 
 

  // // downloadFile() async {
  // //   final Map<String, dynamic> dataBody = {
  // //     "semester_value": "1",
  // //     "nim_value": "2151B1070",
  // //   };
  // //   Dio dio = Dio();
  // //   var response = await dio.post("https://sia.iik-strada.ac.id/mhs_krs/download_krs",
  // //     options: Options(
  // //       headers: {"Accept": "application/json"},
  // //       // method: 'POST',
  // //       followRedirects: false,
  // //       validateStatus: (status) { return status! < 500; }
        
  // //     ),
  // //     data: dataBody,
  // //   );

  // //   print(response.statusCode);
  // // }

