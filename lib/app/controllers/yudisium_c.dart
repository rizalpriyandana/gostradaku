import 'dart:convert';

import 'package:get/get.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:http/http.dart' as http;

import '../data/models/test_m.dart';
import '../data/models/yudisium_m.dart';

class YudisiumController extends GetxController {
  cekyudis(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/yudisium/cek_yudisium"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = Yudisiummodel.fromJson(databody);
        return result;
      }
    }
  }

  ajukanyudis(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/yudisium/ajukan_yudisium"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        Get.snackbar('Hi', 'Yudisium berhasil diajukan');
        Get.offAllNamed(RoutName.root);
      }
    } else {
      Get.snackbar('Hi', "Kesalahan server");
    }
  }
}
