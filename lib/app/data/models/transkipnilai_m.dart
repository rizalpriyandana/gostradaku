// To parse this JSON data, do
//
//     final transkipNilai = transkipNilaiFromJson(jsonString);


import 'dart:convert';

TranskipNilai transkipNilaiFromJson(String str) =>
    TranskipNilai.fromJson(json.decode(str));

class TranskipNilai {
  TranskipNilai({
    required this.data,
    required this.error,
    required this.totalBobot,
    required this.ipk,
    required this.prestasi,
  });

  final List<Datum>? data;
  final bool error;
  final int totalBobot;
  final String ipk;
  final String prestasi;

  factory TranskipNilai.fromJson(Map<String, dynamic> json) => TranskipNilai(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
        totalBobot: json["total_bobot"] == null ? null : json["total_bobot"],
        ipk: json["ipk"] == null ? null : json["ipk"],
        prestasi: json["prestasi"] == null ? null : json["prestasi"],
      );
}

class Datum {
  Datum({
    required this.codeMk,
    required this.name,
    required this.englishName,
    required this.bobot,
    required this.nilaiHuruf,
    required this.index,
  });

  final String codeMk;
  final String name;
  final String englishName;
  final String bobot;
  final String nilaiHuruf;
  final int index;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        codeMk: json["code_mk"] == null ? null : json["code_mk"],
        name: json["name"] == null ? null : json["name"],
        englishName: json["english_name"] == null ? null : json["english_name"],
        bobot: json["bobot"] == null ? null : json["bobot"],
        nilaiHuruf: json["nilai_huruf"] == null ? null : json["nilai_huruf"],
        index: json["index"] == null ? null : json["index"],
      );
}
