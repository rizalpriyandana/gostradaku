import 'dart:io';


import 'package:get/get.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:gostradav1/app/controllers/auth/auth_c.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../data/models/test_m.dart';

class WisudaController extends GetxController {
  AuthController c = Get.find<AuthController>();
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;
  var isLoading = true.obs;
  String pathurlpdfmhs = "";
  String pathurlpdfortu = "";
  String downloadedFilePath = "";
  String downloadedFilePath2 = "";

  @override
  void onInit() {
    myqr(data['nim']);
  
    // myqrmhs(data['nim'], "M");
    // myqrortu(data['nim'], "O");
    // downloadFile(c.pathurlpdfmhs, path.basename(c.pathurlpdfmhs));
    // downloadFile2(c.pathurlpdfortu, path.basename(c.pathurlpdfortu));
    super.onInit();
    
  }

  myqr(nim) async {
    final Map<String, dynamic> dataBody = {
      QrModel.nim: nim,
      
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/wisuda/my_graduation"),
        body: dataBody);
    if (response.statusCode == 200) {
      var dataku = jsonDecode(response.body);
      if (dataku['error'] == true) {
        return null;
      } else {
        pathurlpdfmhs = dataku['data']['mahasiswa'];
        pathurlpdfortu = dataku['data']['ortu'];
        String filenamemhs = path.basename(pathurlpdfmhs);
        String filenameortu = path.basename(pathurlpdfortu);
        await downloadFile(pathurlpdfmhs, filenamemhs);
        await downloadFile2(pathurlpdfortu, filenameortu);
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Go-Strada", "Gagal Memuat Data");
    }
  }

  myqrortu(nim, jenis) async {
    final Map<String, dynamic> dataBody = {
      QrModel.nim: nim,
      QrModel.jenis: jenis
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/wisuda/my_graduation"),
        body: dataBody);
    if (response.statusCode == 200) {
      var dataku = jsonDecode(response.body);
      if (dataku['error'] == true) {
        return null;
      } else {
        pathurlpdfortu = dataku['data'];
        String filename = path.basename(pathurlpdfortu);
        await downloadFile2(pathurlpdfortu, filename);
        isLoading.value = false;
      }
    } else {
      Get.snackbar("Go-Strada", "Gagal Memuat Data");
    }
  }

  Future<File> downloadFile(String url, String fileName) async {
    var httpClient = http.Client();
    var req = await httpClient.get(Uri.parse(url));
    var bytes = req.bodyBytes;
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$fileName');
    await file.writeAsBytes(bytes);
    downloadedFilePath = file.path;
    return file;
  }

  Future<File> downloadFile2(String url, String fileName) async {
    var httpClient = http.Client();
    var req = await httpClient.get(Uri.parse(url));
    var bytes = req.bodyBytes;
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$fileName');
    await file.writeAsBytes(bytes);
    downloadedFilePath2 = file.path;
    return file;
  }
}
