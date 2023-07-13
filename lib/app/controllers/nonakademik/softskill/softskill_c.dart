import 'dart:convert';
import 'dart:io';

// import 'package:file_picker/file_picker.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:gostradav1/app/data/models/periode_m.dart';
import 'package:gostradav1/app/data/models/softskill/editsoftskill_m.dart';
import 'package:gostradav1/app/data/models/softskill/softskill_m.dart';
import 'package:gostradav1/app/data/models/test_m.dart';
import 'package:gostradav1/app/routes/rout_name.dart';

import 'package:http/http.dart' as http;

class SoftSkillController extends GetxController {
  RxString filePath = ''.obs;
  var isLoading = false.obs;
  String tpmhs = "M";
  String pathurlpdf = "";
  List<String> periode = [];
  List<String> idperiode = [];
  List<EditSoftSkillModel> editsoftskilllist = [];
  File? files;
  RxList<SoftSkillModel> softskilllist = <SoftSkillModel>[].obs;
  //var softskilllist =  RxList<SoftSkillModel>();
  final box = GetStorage().obs;

  // Future<void> choseFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   final file = result.files.single;
  //   filePath.value = file.name;
  // }

  listdata(String nim) async {
    final Map<String, dynamic> dataBody = {
      SoftSkill.nim: nim,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/nonakademik/list_data"),
        body: dataBody);

    if (response.statusCode == 200) {
      var softskill = jsonDecode(response.body);
      if (softskill['error'] == true) {
      } else {
        // box.value.write('dataSoftSkill', {
        //   "id_periode": softskill['id_periode'],
        //   "periode": softskill['periode'],
        //   "nilai_angka": softskill['nilai_angka'],
        //   "nilai_huruf": softskill['nilai_huruf'],
        //   "id": softskill['id'],
        //   "name": softskill['name'],
        //   "date": softskill['date'],
        //   "note": softskill['note'],
        //   "status": softskill['status'],
        //   "label_status": softskill['label_status'],
        //   "note_status": softskill['note_status'],
        //   "admin": softskill['admin'],
        //   "file": softskill['file'],
        //   "type_file": softskill['type_file'],
        // });
        var result = SoftSkillModel.fromJson(softskill);
        softskilllist.value = result.data!
            .map((datum) => SoftSkillModel(data: [datum], error: false))
            .toList();
      }
    }
  }

  inputdata(String nim, String idPeriode, String name, String date, String note,
      String nilaiangka, String nilaihuruf, files) async {
    File file = File(files.path);
    isLoading.value = true;

    var request = http.MultipartRequest('POST',
        Uri.parse('https://siakad.strada.ac.id/mobile/nonakademik/save'));
    request.fields.addAll({
      'nim': nim,
      'id_periode': idPeriode,
      'name': name,
      'date': date,
      'note': note,
      'nilai_angka': nilaiangka,
      'nilai_huruf': nilaihuruf,
    });
    request.files.add(await http.MultipartFile.fromBytes(
        'file_', File(file.path).readAsBytesSync(),
        filename: file.path));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      ever(softskilllist, (_) {
        update();
      });
      isLoading.value = false;
      Get.toNamed(RoutName.softskill);
      Get.snackbar('Sucsess', 'Data Berhasil Disimpan');
      idperiode.clear();
    } else {
      Get.snackbar("Galat", "Data tidak berhasil disimpan");
    }
  }

  updatedata(String id, String nim, String idPeriode, String name, String date,
      String note, String nilaiangka, String nilaihuruf, files) async {
    File file = File(files.path);

    var request = http.MultipartRequest('POST',
        Uri.parse("https://siakad.strada.ac.id/mobile/nonakademik/update"));
    request.fields.addAll({
      'id': id,
      'nim': nim,
      'id_periode': idPeriode,
      'name': name,
      'date': date,
      'note': note,
      'nilai_angka': nilaiangka,
      'nilai_huruf': nilaihuruf,
    });
    request.files.add(await http.MultipartFile.fromBytes(
        'file_', File(file.path).readAsBytesSync(),
        filename: file.path));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      ever(softskilllist, (_) {
        update();
      });
      Get.toNamed(RoutName.softskill);
      Get.snackbar('Sucsess', 'Data Berhasil Diupdate');
      idperiode.clear();
    } else {
      Get.snackbar("Galat", "Data tidak berhasil diupdate");
    }
  }

  delete(String id) async {
    final Map<String, dynamic> dataBody = {
      SoftSkill.id: id,
    };
    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/nonakademik/delete"),
        body: dataBody);
    if (response.statusCode == 200) {
      softskilllist.removeWhere((datum) => datum.data![0].id == id);
      ever(softskilllist, (_) {
        update();
      });
      Get.back();
      Get.snackbar('Sucsess', "Data berhasil dihapus");
    } else {
      Get.snackbar('Galat', 'Data tidak berhasil dihapus');
    }
  }

  getperiode() async {
    var response = await http.get(
      Uri.parse('https://siakad.strada.ac.id/mobile/data/get_periode'),
    );
    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);
      if (databody['error'] == true) {
        return null;
      } else {
        var result = PeriodeModel.fromJson(databody);
        periode.clear();
        for (var item in result.periode.data) {
          periode.add(item.name);
        }
        for (var item in result.periode.data) {
          idperiode.add(item.id);
        }
        return result;
      }
    }
  }

  myqr(nim, jenis) async {
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
      }else{
        pathurlpdf = dataku['data'];
      }
    } else {
      Get.snackbar("Go-Strada","Gagal Memuat Data");
    }
  }

  editdata(String id) async {
    final Map<String, dynamic> dataBody = {
      SoftSkill.id: id,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/nonakademik/get_data"),
        body: dataBody);
    if (response.statusCode == 200) {
      var dataBody = jsonDecode(response.body);
      if (dataBody['error'] == true) {
      } else {
        Get.toNamed(RoutName.editsoftskill);
        var result = EditSoftSkillModel.fromJson(dataBody);
        // box.value.write('dataSoftSkill', {
        //   "nim": dataBody['nim'],
        //   "id": dataBody['id'],
        //   "name": dataBody['name'],
        //   "date": dataBody['date'],
        //   "note": dataBody['note'],
        //   "created_date": dataBody['created_date'],
        //   "created_by": dataBody['created_by'],
        //   "status": dataBody['status'],
        //   "label_status": dataBody['label_status'],
        //   "note_status": dataBody['note_status'],
        //   "file": dataBody['file'],
        //   "id_periode": dataBody['id_periode'],
        //   "periode": dataBody['periode'],
        //   "nilai_angka": dataBody['nilai_angka'],
        //   "nilai_huruf": dataBody['nilai_huruf'],
        // });
        return result;
      }
    }
  }

  @override
  void onReady() {
    ever(softskilllist, (_) {
      update();
    });
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    onReady();
  }
}
