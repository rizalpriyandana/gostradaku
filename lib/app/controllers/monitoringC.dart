import 'dart:convert';

import 'package:get/get.dart';
import 'package:gostradav1/app/data/models/absen_m.dart';
import 'package:gostradav1/app/data/models/monitoringmodel.dart';
import 'package:http/http.dart' as http;

import '../data/models/detailjadwal_m.dart';
import '../data/models/test_m.dart';

class MonitoringController extends GetxController {
  GetJadwalAbsensi(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };

    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/monitoring/list_perkuliahan"),
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
        var result = JadwalAbsensiModel.fromJson(databody);
        return result;
      }
    }
  }

  GetAbsen(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/monitoring/detail_absensi"),
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
        var result = AbsensiModel.fromJson(databody);
        return result;
      }
    }
  }

  GetDetailJadwal(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/monitoring/detail_jadwal"),
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
        var result = DetailJadwalModel.fromJson(databody);
        return result;
      }
    } else {}
  }

  GetDetailAbsensi(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/monitoring/menu_absensi"),
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
        var result = AbsensiModel.fromJson(databody);

        return result;
      }
    }
  }
}
