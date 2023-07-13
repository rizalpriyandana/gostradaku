import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/data/models/login_m.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final box = GetStorage().obs;
  var isVisible = true.obs;
  var errorMsg = false.obs;
  var errorPas = false.obs;
  late TextEditingController nimC = TextEditingController();
  late TextEditingController passC = TextEditingController();
  var isLoading = false.obs;
  @override
  void onInit() {
    errorMsg.value = false;
    super.onInit();
  }

  // Login
  login(nim, password) async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    isLoading.value = true;
    final Map<String, dynamic> dataBody = {
      LoginModel.username: nim,
      LoginModel.password: password,
    };
    try {
      var response =
          await http.post(Uri.parse(LoginModel.urlApi), body: dataBody);
      if (response.statusCode == 200) {
        var user = jsonDecode(response.body);
        if (user['error'] == true) {
          // if username not match
          isLoading.value = false;
          errorMsg.value = true;
          Get.offNamed(RoutName.login);
          return "salah";
        } else {
          // login berhasil
          box.value.write('dataUser', {
            "username": user['nim'],
            "password": user['nim'],
            "nim": user['nim'],
            "photo": user['photo'],
            "name": user['name'],
            "id_fakul": user["id_fakultas"]
          });
          isLoading.value = false;

          // go to dashboard page
          Get.offNamed(RoutName.root);
          // print(fcmToken);
          // FlutterClipboard.copy(fcmToken.toString())
          //     .then((value) => Get.snackbar('Hi', 'Copied'));
          insertToken(nim, fcmToken.toString());
          return user;
        }
      } else {
        //Get.snackbar('Hi', 'Koneksi Error');
        return null;
      }
    } on SocketException catch (_) {
      Get.defaultDialog(middleText: "Cek Koneksi Anda");
    }
    //http request post
  }

  resetpassword(String nim) async {
    final Map<String, dynamic> dataBody = {
      InsertTokenModel.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/lupa_password/generate"),
        body: dataBody);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      if (user['error'] == true) {
        errorPas.value = true;
        return null;
      } else {
        // login berhasil

        Get.defaultDialog(
            onConfirm: () => Get.offNamed(RoutName.login),
            middleText: "Password berhasil direset kembali ke nim");

        errorPas.value = false;
        errorMsg.value = false;
        return user;
      }
    } else {
      errorPas.value = true;
      return null;
    }
  }

  insertToken(String nim, String token) async {
    final Map<String, dynamic> dataBody = {
      InsertTokenModel.nim: nim,
      InsertTokenModel.token: token,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/token/save_token"),
        body: dataBody);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      if (user['error'] == true) {
        return null;
      } else {
        // login berhasil

        return user;
      }
    } else {
      Get.snackbar('Hi', 'Koneksi Error');
      return null;
    }
  }

  deleteToken(String nim) async {
    final Map<String, dynamic> dataBody = {
      InsertTokenModel.nim: nim,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/token/delete_token"),
        body: dataBody);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      if (user['error'] == true) {
        return null;
      } else {
        // login berhasil

        return user;
      }
    } else {
      Get.snackbar('Hi', 'Koneksi Error');
      return null;
    }
  }

  // logout
  logout(String nim) async {
    deleteToken(nim);
    await box.value.remove('dataUser');
    await box.value.remove('nomorva');
    await box.value.remove('nominal');
    errorMsg.value = false;
    nimC.clear();
    passC.clear();

    Get.offAllNamed(RoutName.login);
  }
  // end logout

}
