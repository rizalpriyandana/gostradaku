import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../data/models/test_m.dart';

class QRCODEController extends GetxController {
  inputqrcode(String nim, String code) async {
    final Map<String, dynamic> dataBody = {
      QrCode.nim: nim,
      QrCode.code: code,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/monitoring/qrcode"),
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
        // Get.snackbar('Hi', databody['error_msg']);
        // Get.offAllNamed(RoutName.root);
        return databody;
      } else {
        // Get.snackbar('Hi', databody['pesan']);
        // Get.offAllNamed(RoutName.root);
        return databody;
      }
    }
  }
}
