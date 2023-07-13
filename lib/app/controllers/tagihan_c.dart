import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:gostradav1/app/data/models/bankmodel.dart';
import 'package:gostradav1/app/data/models/tagihan_m.dart';
import 'package:http/http.dart' as http;

import '../data/models/test_m.dart';
import '../ui/pages/kategori/tagihan/preview/preview_pembayaran.dart';

class TagihanController extends GetxController {
  RxInt totaltagihan = 0.obs;
  RxInt sisa = 0.obs;
  var isLoading = false.obs;
  List<String> id = [];
  List<String> name = [];
  List<BuatTagihanModel> data = [];
  List<dynamic> datadatum = [];
  String total = "";
  String namatagihan = "";
  String labeljenis = "";
  List<bool> isVisible = [];
  List<TextEditingController> controllers = [];
  List<TextEditingController> controllers2 = [];
  RxString hitungmundur = "".obs;
  final box = GetStorage();

  toggle(bool isVisible) {
    isVisible = !isVisible;

    update();
    return isVisible;
  }

  Tagihan(String nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/keuangan/tagihan"),
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
        var result = TagihanModel.fromJson(databody);

        return result;
      }
    }
  }

  getcredit(nim) async {
    final Map<String, dynamic> dataBody = {
      RBModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/keuangan/select_credit"),
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
        var result = GetCreditModel.fromJson(databody);
        id.clear();
        name.clear();
        for (var item in result.data) {
          id.add(item.id);
        }
        for (var item in result.data) {
          name.add(item.name);
        }
        return result;
      }
    }
  }

  loadsemuatagihan(nim) async {
    final Map<String, dynamic> dataBody = {
      TagihanMo.nim: nim,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/keuangan/buat_tagihan"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error
        return null;
      } else {
        totaltagihan.value = 0;
        var result = BuatTagihanModel.fromJson(databody);
        for (var i = 0; i < result.data!.length; i++) {
          totaltagihan.value += result.data![i].nominal;
        }
        data.clear();
        datadatum.clear();
        data.add(result);
        for (var i = 0; i < result.data!.length; i++) {
          datadatum.add(result.data![i]);
        }

        update();
        return result;
      }
    }
  }

  resetTotal() {
    totaltagihan.value = 0;
    update();
  }

  confirmtagihan(nim, id_biaya, id_credit, bayar) async {
    isLoading.value = true;
    final Map<String, dynamic> dataBody = {
      BuatTagihan.nim: nim,
      BuatTagihan.id_biaya: id_biaya,
      BuatTagihan.id_credit: id_credit,
      BuatTagihan.bayar: bayar,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/keuangan/save_tagihan"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        return null;
      } else {
        var result = SaveTagihanModel.fromJson(databody);
        isLoading.value = false;
        Get.to(PreviewPembayaranPage(),
            arguments: [result.codeTrans, total, labeljenis]);
        Get.snackbar('Hi', 'Tagihan Berhasil Disimpan');
      }
    }
  }

  DataBank() async {
    var response = await http
        .get(Uri.parse("https://siakad.strada.ac.id/mobile/data/get_bank"));

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error

        return null;
      } else {
        var result = BankModel.fromJson(databody);

        return result;
      }
    }
  }

  pengajuanceksemester(String nim) async {
    final Map<String, dynamic> dataBody = {
      BuatTagihan.nim: nim,
    };

    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/pengajuan_keringanan/get_semester"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        return null;
      } else {
        return pengajuancek(nim, databody["semester"]);
      }
    }
  }

  pengajuancek(String nim, String semester) async {
    final Map<String, dynamic> dataBody = {
      GetSks.nim: nim,
      GetSks.semester: semester,
    };

    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/pengajuan_keringanan/get_keringanan"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        return null;
      } else {
        return databody;
      }
    } else {}
  }
}
