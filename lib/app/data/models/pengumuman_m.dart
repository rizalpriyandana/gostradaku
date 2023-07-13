// To parse this JSON data, do
//
//     final pengumumanModel = pengumumanModelFromJson(jsonString);


import 'dart:convert';

PengumumanModel pengumumanModelFromJson(String str) =>
    PengumumanModel.fromJson(json.decode(str));

class PengumumanModel {
  PengumumanModel({
    required this.data,
    required this.total,
    required this.error,
  });

  final List<Datum>? data;
  final int total;
  final bool error;

  factory PengumumanModel.fromJson(Map<String, dynamic> json) =>
      PengumumanModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
        error: json["error"] == null ? null : json["error"],
      );
}

class Datum {
  Datum({required this.title, required this.gambar, required this.id});

  final String title;
  final String gambar;
  final String id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"] == null ? "" : json["title"],
        gambar: json["gambar"] == null ? "" : json["gambar"],
        id: json["id"] == null ? "" : json["id"],
      );
}
// To parse this JSON data, do
//
//     final pengumumanDetailModel = pengumumanDetailModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final pengumumanDetailModel = pengumumanDetailModelFromJson(jsonString);

PengumumanDetailModel pengumumanDetailModelFromJson(String str) =>
    PengumumanDetailModel.fromJson(json.decode(str));

class PengumumanDetailModel {
  PengumumanDetailModel({
    required this.data,
    required this.total,
    required this.error,
  });

  final Data? data;
  final int total;
  final bool error;

  factory PengumumanDetailModel.fromJson(Map<String, dynamic> json) =>
      PengumumanDetailModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        total: json["total"] == null ? null : json["total"],
        error: json["error"] == null ? null : json["error"],
      );
}

class Data {
  Data({
    required this.title,
    required this.gambar,
    required this.content,
    required this.createdDate,
  });

  final String title;
  final String gambar;
  final String content;
  final DateTime? createdDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"] == null ? null : json["title"],
        gambar: json["gambar"] == null ? "" : json["gambar"],
        content: json["content"] == null ? null : json["content"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
      );
}
