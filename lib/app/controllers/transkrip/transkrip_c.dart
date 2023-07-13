import 'dart:convert';

import 'package:get/get.dart';

class TranskripController extends GetxController {
  List<dynamic> transkripNilai = [
    {
      "semester": "1",
      "data":
          "{\"data\":[{\"code_mk\":\"MKM20005\",\"bobot\":\"1\",\"name\":\"Bahasa Inggris I\",\"angka\":\"English I.\",\"nilai\":\"AB\",\"mutu\":\"3.5\"},{\"code_mk\":\"MKM19006\",\"bobot\":\"2\",\"name\":\"Epidemiologi \",\"angka\":\"Epidemiology\",\"nilai\":\"A\",\"mutu\":\"8\"},{\"code_mk\":\"MKM19007\",\"bobot\":\"2\",\"name\":\"Kesehatan Lingkungan\",\"angka\":\"Environmental Health\",\"nilai\":\"A\",\"mutu\":\"8\"},{\"code_mk\":\"MKM 067\",\"bobot\":\"2\",\"name\":\"Metodologi  Penelitian\",\"angka\":\"Research methodology\",\"nilai\":\"A\",\"mutu\":\"8\"},{\"code_mk\":\"MKM 002\",\"bobot\":\"2\",\"name\":\"Global Health\",\"angka\":\"Global Health.\",\"nilai\":\"A\",\"mutu\":\"8\"},{\"code_mk\":\"MKM 003\",\"bobot\":\"2\",\"name\":\"Kebijakan dan Manajemen Kesehatan\",\"angka\":\"Health Policies and Management\",\"nilai\":\"AB\",\"mutu\":\"7\"},{\"code_mk\":\"MKM 005\",\"bobot\":\"2\",\"name\":\"Ilmu Sosial dan Perilaku\",\"angka\":\"Social science and behavior\",\"nilai\":\"A\",\"mutu\":\"8\"},{\"code_mk\":\"MKM 008\",\"bobot\":\"2\",\"name\":\"Kepemimpinan & Berpikir Sistem\",\"angka\":\"Leadership & Thinking System\",\"nilai\":\"B\",\"mutu\":\"6\"},{\"code_mk\":\"MKM2101\",\"bobot\":\"3\",\"name\":\"Biostatistika\",\"angka\":\"Biostatistics\",\"nilai\":\"A\",\"mutu\":\"12\"},{\"code_mk\":\"MKM2102\",\"bobot\":\"2\",\"name\":\"Teknologi Digital dalam Industri Kesehatan\",\"angka\":\"Digital Technology in the Health Industry\",\"nilai\":\"B\",\"mutu\":\"6\"}]}"
    },
    {
      "semester": "2",
      "data":
          "{\"data\":[{\"code_mk\":\"MKM20013\",\"bobot\":\"1\",\"name\":\"Bahasa Inggris II\",\"angka\":\"English II.\",\"nilai\":\"\",\"mutu\":\"\"},{\"code_mk\":\"MKM20060\",\"bobot\":\"3\",\"name\":\"Seminar Usulan Penelitian\",\"angka\":\"Research Seminar\",\"nilai\":\"\",\"mutu\":\"\"},{\"code_mk\":\"MKM20075\",\"bobot\":\"3\",\"name\":\"Fisioterapi Kesehatan Masyarakat\",\"angka\":\"Public Health Physiotherapy\",\"nilai\":\"\",\"mutu\":\"\"},{\"code_mk\":\"MKM20077\",\"bobot\":\"2\",\"name\":\"Fisioterapi Komunitas Pada Usia Dewasa & Produktif\",\"angka\":\"Community Physiotherapy in Adult & Productive Age\",\"nilai\":\"\",\"mutu\":\"\"},{\"code_mk\":\"MKM20078\",\"bobot\":\"2\",\"name\":\"Fisioterapi Komunitas Pada Usia Lanjut\",\"angka\":\"Community Physiotherapy in the Elderly\",\"nilai\":\"\",\"mutu\":\"\"},{\"code_mk\":\"MKM20076\",\"bobot\":\"3\",\"name\":\"Fisioterapi Komunitas Pada Kehamilan, Bayi, Anak & Remaja\",\"angka\":\"Community Physiotherapy in Pregnancy, Infants, Children & Adolescents\",\"nilai\":\"\",\"mutu\":\"\"},{\"code_mk\":\"MKM20079\",\"bobot\":\"2\",\"name\":\"Etika & Organisasi Profesi Fisioterapi\",\"angka\":\"Ethics & Organization of the Physiotherapy Profession\",\"nilai\":\"\",\"mutu\":\"\"}]}"
    }
  ];
  var result;

  @override
  void onInit() {
    super.onInit();
    result = jsonDecode(transkripNilai[0]['data']);
  }
}
