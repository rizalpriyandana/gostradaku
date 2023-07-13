import 'dart:convert';

import 'package:get/get.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:http/http.dart' as http;
import '../data/models/quesioner_m.dart';
import '../data/models/test_m.dart';

class QuesionerController extends GetxController {
  List<int> totalbobot = [];
  RxList<dynamic> soal = [].obs;
  List<String> soal1 = [];
  List<String> idDetailQuiz = [];
  @override
  input(Object? value, int j, List<String> bobot, int index) {
    soal[j] = value!;
    totalbobot[j] = int.parse(bobot[index]);
    update();
  }

  quesioner(String nim, String semester, String code_mk) async {
    final Map<String, dynamic> dataBody = {
      GetSks.nim: nim,
      GetSks.semester: semester,
      GetSks.code_mk: code_mk
    };
    print("nim" + nim + " semester" + semester + " code_mk " + code_mk);

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/edom/get_quisoner"),
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
        soal.clear();
        soal1.clear();
        idDetailQuiz.clear();
        totalbobot.clear();

        var result = QuesionerDetailModel.fromJson(databody);
        for (var i = 0; i < result.quisoner![0].data!.length; i++) {
          soal.add(result.quisoner![0].data![i].pertanyaan);
          soal1.add(result.quisoner![0].data![i].pertanyaan);
          idDetailQuiz.add(result.quisoner![0].data![i].idDetailQuiz);
          totalbobot.add(0);
        }

        return result;
      }
    } else {}
  }

  inputjawabanmaster(
      String nim,
      String id_periode,
      String id_dosen,
      String code_mk,
      String total_bobot,
      String id_quiz,
      String id_khs,
      String id_prodi) async {
    final Map<String, dynamic> dataBody = {
      inputMasterJawaban.nim: nim,
      inputMasterJawaban.id_periode: id_periode,
      inputMasterJawaban.id_dosen: id_dosen,
      inputMasterJawaban.code_mk: code_mk,
      inputMasterJawaban.total_bobot: total_bobot,
      inputMasterJawaban.id_quiz: id_quiz,
      inputMasterJawaban.id_khs: id_khs,
      inputMasterJawaban.id_prodi: id_prodi,
    };

    var response = await http.post(
        Uri.parse("https://siakad.strada.ac.id/mobile/edom/save_quisoner"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error

        return null;
      } else {
        for (var i = 0; i < soal.length; i++) {
          inputjawabandetail(nim, (databody["id_evaluasi_dosen"]).toString(),
              idDetailQuiz[i], soal1[i], soal[i], totalbobot[i].toString());
        }
        Get.snackbar('Hi', 'Jawaban telah dikirim');
        Get.offNamed(RoutName.khs);
      }
    } else {}
  }

  inputjawabandetail(
      String nim,
      String id_evaluasi_dosen,
      String id_detail_quiz,
      String pertanyaan,
      String jawaban,
      String nilai) async {
    final Map<String, dynamic> dataBody = {
      inputDetailJawaban.nim: nim,
      inputDetailJawaban.id_evaluasi_dosen: id_evaluasi_dosen,
      inputDetailJawaban.id_detail_quiz: id_detail_quiz,
      inputDetailJawaban.pertanyaan: pertanyaan,
      inputDetailJawaban.jawaban: jawaban,
      inputDetailJawaban.nilai: nilai,
    };

    var response = await http.post(
        Uri.parse(
            "https://siakad.strada.ac.id/mobile/edom/save_detail_quisoner"),
        body: dataBody);

    if (response.statusCode == 200) {
      var databody = jsonDecode(response.body);

      if (databody['error'] == true) {
        //show error

        return null;
      } else {}
    } else {}
  }
}
