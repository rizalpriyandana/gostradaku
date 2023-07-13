// To parse this JSON data, do
//
//     final detailKhsModel = detailKhsModelFromJson(jsonString);


import 'dart:convert';

DetailKhsModel detailKhsModelFromJson(String str) =>
    DetailKhsModel.fromJson(json.decode(str));

class DetailKhsModel {
  DetailKhsModel({
    required this.totalSks,
    required this.ip,
    required this.ipk,
    required this.data,
    required this.error,
  });

  final int totalSks;
  final String? ip;
  final String? ipk;
  final List<Datum>? data;
  final bool error;

  factory DetailKhsModel.fromJson(Map<String, dynamic> json) => DetailKhsModel(
        totalSks: json["total_sks"] == null ? null : json["total_sks"],
        ip: json["ip"] == null ? null : json["ip"],
        ipk: json["ipk"] == null ? null : json["ipk"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
      );
}

class Datum {
  Datum({
    required this.idKelas,
    required this.codeMk,
    required this.bobot,
    required this.name,
    required this.statusQuiz,
    required this.angka,
    required this.nilai,
    required this.mutu,
  });

  final String? idKelas;
  final String codeMk;
  final String bobot;
  final String name;
  final String statusQuiz;
  final String? angka;
  final String? nilai;
  final String? mutu;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idKelas: json["id_kelas"] == null ? null : json["id_kelas"],
        codeMk: json["code_mk"] == null ? null : json["code_mk"],
        bobot: json["bobot"] == null ? null : json["bobot"],
        name: json["name"] == null ? null : json["name"],
        angka: json["angka"] == null ? null : json["angka"],
        nilai: json["nilai"] == null ? null : json["nilai"],
        mutu: json["mutu"] == null ? null : json["mutu"],
        statusQuiz: json["status_quiz"] == null ? null : json["status_quiz"],
      );
}
