import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../data/models/tagihan_m.dart';
import '../data/models/test_m.dart';

class VaController extends GetxController {
  final box = GetStorage();
  RxString hitungmundur = "".obs;
  void onInit() {
    const oneSec = Duration(seconds: 1);

    Timer.periodic(
        oneSec,
        (Timer t) => (box.read("DatetimeAkhir") == null)
            ? null
            : hitungmundurva(
                DateTime.now(), DateTime.parse(box.read("DatetimeAkhir"))));
    print("test");
    super.onInit();
  }

  getva(String nim, String total_payment, String name, String code_trans,
      String id_fakul) async {
    final Map<String, dynamic> dataBody = {
      CodeVA.nim: nim,
      CodeVA.total_payment: total_payment,
      CodeVA.name: name,
      CodeVA.code_trans: code_trans,
      CodeVA.id_fakul: id_fakul
    };
    print(code_trans);
    print(total_payment);
    print(name);
    print(nim);
    print(id_fakul);
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/payment/create_ecollection"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      print(response.body);
      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        var result = CodeVaModel.fromJson(databody);
        print(databody);
        Get.snackbar('Hi', "Va berhasil dibuat");
        DateTime now = DateTime.now();
        DateTime limit = result.dateExpired!;
        String limitstring = limit.toString();
        box.write("DatetimeAkhir", limitstring);
        print(databody);
        DateTime limitt = DateTime.parse(box.read("DatetimeAkhir"));
        hitungmundurva(now, limitt);
        print(databody);
        return result;
      }
    } else {
      Get.snackbar('Hi', 'Server Error');
    }
  }

  hitungmundurva(DateTime timedibuat, DateTime timeuntil) {
    final difference = timeuntil.difference(timedibuat);

    int value = difference.inSeconds;
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);
    hitungmundur.value = "${h.toString()} : ${m.toString()} : ${s.toString()}";
  }
}
