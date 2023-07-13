// To parse this JSON data, do
//
//     final detailKrs = detailKrsFromJson(jsonString);


import 'dart:convert';

DetailKrs detailKrsFromJson(String str) => DetailKrs.fromJson(json.decode(str));

class DetailKrs {
  DetailKrs({
    required this.totalSks,
    required this.data,
    required this.error,
  });

  final int totalSks;
  final List<Datum>? data;
  final bool error;

  factory DetailKrs.fromJson(Map<String, dynamic> json) => DetailKrs(
        totalSks: json["total_sks"] == null ? null : json["total_sks"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
      );
}

class Datum {
  Datum({
    required this.codeMk,
    required this.bobot,
    required this.name,
    required this.english,
  });

  final String codeMk;
  final String bobot;
  final String name;
  final String english;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        codeMk: json["code_mk"] == null ? null : json["code_mk"],
        bobot: json["bobot"] == null ? null : json["bobot"],
        name: json["name"] == null ? null : json["name"],
        english: json["english"] == null ? null : json["english"],
      );
}
