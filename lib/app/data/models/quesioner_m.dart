// To parse this JSON data, do
//
//     final quesionerDetailModel = quesionerDetailModelFromJson(jsonString);


import 'dart:convert';

QuesionerDetailModel quesionerDetailModelFromJson(String str) =>
    QuesionerDetailModel.fromJson(json.decode(str));

class QuesionerDetailModel {
  QuesionerDetailModel({
    required this.idPeriode,
    required this.idKhs,
    required this.idProdi,
    required this.idQuiz,
    required this.tipeQuiz,
    required this.namaQuiz,
    required this.note,
    required this.quisoner,
    required this.error,
  });

  final String idPeriode;
  final String idKhs;
  final String idProdi;
  final String idQuiz;
  final String tipeQuiz;
  final String namaQuiz;
  final String note;
  final List<Quisoner>? quisoner;
  final bool error;

  factory QuesionerDetailModel.fromJson(Map<String, dynamic> json) =>
      QuesionerDetailModel(
        idPeriode: json["id_periode"] == null ? null : json["id_periode"],
        idKhs: json["id_khs"] == null ? null : json["id_khs"],
        idProdi: json["id_prodi"] == null ? null : json["id_prodi"],
        idQuiz: json["id_quiz"] == null ? null : json["id_quiz"],
        tipeQuiz: json["tipe_quiz"] == null ? null : json["tipe_quiz"],
        namaQuiz: json["nama_quiz"] == null ? null : json["nama_quiz"],
        note: json["note"] == null ? null : json["note"],
        quisoner: json["quisoner"] == null
            ? null
            : List<Quisoner>.from(
                json["quisoner"].map((x) => Quisoner.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
      );
}

class Quisoner {
  Quisoner({
    required this.idDosen,
    required this.codeMk,
    required this.statusKhs,
    required this.data,
    required this.total,
  });

  final String idDosen;
  final String codeMk;
  final String statusKhs;
  final List<Datum>? data;
  final int total;

  factory Quisoner.fromJson(Map<String, dynamic> json) => Quisoner(
        idDosen: json["id_dosen"] == null ? null : json["id_dosen"],
        codeMk: json["code_mk"] == null ? null : json["code_mk"],
        statusKhs: json["status_khs"] == null ? null : json["status_khs"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum({
    required this.idDetailQuiz,
    required this.pertanyaan,
    required this.bobot1,
    required this.bobot2,
    required this.bobot3,
    required this.bobot4,
    required this.bobot5,
    required this.jawaban1,
    required this.jawaban2,
    required this.jawaban3,
    required this.jawaban4,
    required this.jawaban5,
  });

  final String idDetailQuiz;
  final String pertanyaan;
  final String bobot1;
  final String bobot2;
  final String bobot3;
  final String bobot4;
  final String bobot5;
  final String jawaban1;
  final String jawaban2;
  final String jawaban3;
  final String jawaban4;
  final String jawaban5;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idDetailQuiz:
            json["id_detail_quiz"] == null ? null : json["id_detail_quiz"],
        pertanyaan: json["pertanyaan"] == null ? null : json["pertanyaan"],
        bobot1: json["bobot1"] == null ? null : json["bobot1"],
        bobot2: json["bobot2"] == null ? null : json["bobot2"],
        bobot3: json["bobot3"] == null ? null : json["bobot3"],
        bobot4: json["bobot4"] == null ? null : json["bobot4"],
        bobot5: json["bobot5"] == null ? null : json["bobot5"],
        jawaban1: json["jawaban1"] == null ? null : json["jawaban1"],
        jawaban2: json["jawaban2"] == null ? null : json["jawaban2"],
        jawaban3: json["jawaban3"] == null ? null : json["jawaban3"],
        jawaban4: json["jawaban4"] == null ? null : json["jawaban4"],
        jawaban5: json["jawaban5"] == null ? null : json["jawaban5"],
      );
}
