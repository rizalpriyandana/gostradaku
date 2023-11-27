import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/data/models/profile.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final box = GetStorage();
  String urlphoto = "";
  late Map data = box.read("dataUser") as Map<String, dynamic>;

  final String masterKRS =
      'https://siakad.strada.ac.id/mobile/Data/master_krs';
  List<ProfileModel> datalist = [];
  var dataMasterKrs;
  var isLoading = true.obs;
  var user;

  @override
  @override
  onInit() async {
    super.onInit();
    final Map<String, dynamic> dataBody = {
      "nim": data['nim'],
    };

    //http request post
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/profile/get_profile"),
        body: dataBody);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      if (user['error'] == true) {
        //
      } else {
        // load berhasil
        var dataMasterKrs = ProfileModel.fromJson(user);
        // urlphoto = user['data']['photo'];
        datalist.add(dataMasterKrs);
        urlphoto = dataMasterKrs.data![0].photo;
        
        // Get.snackbar("Url", urlphoto);
      }
      
      isLoading.value = false;
    }
  }

  ganti_password(String id, String nim, String username, String oldpwd,
      String newpwd, String repwd) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://siakad.strada.ac.id/mobile/profile/save_profile'));
    request.fields.addAll({
      'id_mhs': id,
      'nim': nim,
      'username': username,
      'old_password': oldpwd,
      'new_password': newpwd,
      'repassword': repwd
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.snackbar('Hi', 'Password Berhasil Diubah');
      Get.offAllNamed(RoutName.root);
    } else {
      Get.snackbar('Hi', 'Password Gagal Diubah Check Input');
    }
  }
}
