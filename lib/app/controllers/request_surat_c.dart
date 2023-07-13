import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import '../data/models/requestsurat.dart';
import '../data/models/test_m.dart';
import '../ui/pages/kategori/riwayat_bayar/detailtransaksi/pdfview.dart';
import '../ui/pages/splash/splashsuccess.dart';
import 'package:intl/intl.dart';

class RequestSuratController extends GetxController {
  List<String> soal = [];
  List<String> pilgan = [];
  RxString txt = "Silahkan memilih jenis surat".obs;
  RxString idJenisSurat = "0".obs;

  getSurat() async {
    var response = await http.post(Uri.parse(
        "https://siakad.strada.ac.id/mobile/request_surat/list_surat"));

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
        var result = DataRequestModel.fromJson(databody);
        return result;
      }
    }
  }

  generateinputsurat(String id_jenis_surat) async {
    final Map<String, dynamic> dataBody = {
      idSurat.id_jenis_surat: id_jenis_surat,
    };

    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/request_surat/get_input_surat"),
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
        var result = SuratModel.fromJson(databody);
        return result;
      }
    } else {}
  }

  sendsurat(Map<String, String> dataBody) async {
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/request_surat/save_surat"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error

        return null;
      } else {
        Get.to(SplashSuccessPage());
      }
    } else {}
  }

  historysurat(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };

    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/request_surat/riwayat_surat"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error

        return null;
      } else {
        var result = HistorySurat.fromJson(databody);
        return result;
      }
    } else {}
  }

  detailhistorysurat(String nim, String nomor_surat) async {
    final Map<String, dynamic> dataBody = {
      detailSurat.nim: nim,
      detailSurat.nomor_surat: nomor_surat,
    };

    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/request_surat/detail_surat"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error

        return null;
      } else {
        var result = HistorydetailModel.fromJson(databody);

        return result;
      }
    } else {}
  }

  Future downloadsurat(Dio dio, String? nim, String nomor_surat, String place,
      ProgressDialog pd) async {
    final Map<String, dynamic> dataBody = {
      detailSurat.nim: nim,
      detailSurat.nomor_surat: nomor_surat,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/request_surat/unduh_surat"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        Get.snackbar('error', databody['error_msg']);
      } else {
        var result = Unduhmodel.fromJson(databody);

        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
          //add more permission to request here.
        ].request();

        if (statuses[Permission.storage]!.isGranted) {
          DateTime now = DateTime.now();
          String formatdate = DateFormat('EEE d MMM kk-mm-ss').format(now);
          String savename = "Surat $formatdate.pdf";
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
            Get.to(const MyPage(), arguments: savePath);
          } on DioError catch (e) {}
        } else {
          Get.snackbar('Failed', 'No permission to read and write.');
        }
      }
    } else {}
  }
}
