import 'dart:convert';

GetSksModel getSksModelFromJson(String str) =>
    GetSksModel.fromJson(json.decode(str));

class GetSksModel {
  GetSksModel({
    required this.data,
    required this.totalSks,
    required this.error,
  });

  final List<Datum>? data;
  final int totalSks;
  final bool error;

  factory GetSksModel.fromJson(Map<String, dynamic> json) => GetSksModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalSks: json["total_sks"] == null ? null : json["total_sks"],
        error: json["error"] == null ? null : json["error"],
      );
}

class Datum {
  Datum({
    required this.codeMk,
    required this.name,
    required this.bobot,
  });

  final String codeMk;
  final String name;
  final String bobot;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        codeMk: json["code_mk"] == null ? null : json["code_mk"],
        name: json["name"] == null ? null : json["name"],
        bobot: json["bobot"] == null ? null : json["bobot"],
      );

  Map<String, dynamic> toJson() => {
        "code_mk": codeMk == null ? null : codeMk,
        "name": name == null ? null : name,
        "bobot": bobot == null ? null : bobot,
      };
}
