import 'dart:convert';

GetMhsModel getMhsModelFromJson(String str) =>
    GetMhsModel.fromJson(json.decode(str));

class GetMhsModel {
  GetMhsModel({
    required this.data,
    required this.semester,
    required this.error,
  });

  final Data? data;
  final String? semester;
  final bool error;

  factory GetMhsModel.fromJson(Map<String, dynamic> json) => GetMhsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        semester: json["semester"] == null ? null : json["semester"],
        error: json["error"] == null ? null : json["error"],
      );
}

class Data {
  Data({
    required this.id,
    required this.nim,
    required this.name,
    required this.tahun,
    required this.fakultas,
    required this.prodi,
  });

  final String id;
  final String nim;
  final String name;
  final String tahun;
  final String fakultas;
  final String prodi;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        nim: json["nim"] == null ? null : json["nim"],
        name: json["name"] == null ? null : json["name"],
        tahun: json["tahun"] == null ? null : json["tahun"],
        fakultas: json["fakultas"] == null ? null : json["fakultas"],
        prodi: json["prodi"] == null ? null : json["prodi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nim": nim == null ? null : nim,
        "name": name == null ? null : name,
        "tahun": tahun == null ? null : tahun,
        "fakultas": fakultas == null ? null : fakultas,
        "prodi": prodi == null ? null : prodi,
      };
}

// To parse this JSON data, do
//
//     final getSksModel = getSksModelFromJson(jsonString);

