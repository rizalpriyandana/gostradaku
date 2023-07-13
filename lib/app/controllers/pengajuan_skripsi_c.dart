import 'dart:convert';

import 'package:get/get.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:http/http.dart' as http;
import '../data/models/pembimbing.dart';
import '../data/models/test_m.dart';

class SkripsiController extends GetxController {
  RxString pilih = "Pilih Dosen".obs;
  RxString id_dosen = "".obs;
  RxBool usingsearch = false.obs;

  List<DosenPembimbingModel> dosen = [];
  up() {
    update();
  }

  search(String query) async {
    final Map<String, dynamic> dataBody = {chatclass.query: query};
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/skripsi/search_pembimbing"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
      } else {
        dosen.clear();
        var result = DosenPembimbingModel.fromJson(databody);
        dosen.add(result);

        return result;
      }
    }
  }

  getdosenskripsi() async {
    var response = await http.get(Uri.parse(
        "https://siakad.strada.ac.id/mobile/skripsi/get_pembimbing"));

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
        var result = DosenPembimbingModel.fromJson(databody);

        return result;
      }
    }
  }

  sendpengajuan(String nim, String judul_1, String judul_2, String judul_3,
      String alasan) async {
    final Map<String, dynamic> dataBody = {
      Skripsi.nim: nim,
      Skripsi.id_dosen: id_dosen.value,
      Skripsi.judul_1: judul_1,
      Skripsi.judul_2: judul_2,
      Skripsi.judul_3: judul_3,
      Skripsi.alasan: alasan,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/skripsi/ajukan_skripsi"),
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
        Get.snackbar('Hi', 'Pengajuan telah dikirim');
        Get.offAllNamed(RoutName.root);
      }
    } else {
      var databody = jsonDecode(response.body);
      Get.snackbar('Hi', databody['pesan']);
    }
  }
}
