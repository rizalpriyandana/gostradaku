// To parse this JSON data, do
//
//     final dosenPembimbingModel = dosenPembimbingModelFromJson(jsonString);


import 'dart:convert';

DosenPembimbingModel dosenPembimbingModelFromJson(String str) =>
    DosenPembimbingModel.fromJson(json.decode(str));

class DosenPembimbingModel {
  DosenPembimbingModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum>? data;
  final int total;

  factory DosenPembimbingModel.fromJson(Map<String, dynamic> json) =>
      DosenPembimbingModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum({
    required this.idDosen,
    required this.dosen,
    required this.counter,
  });

  final String idDosen;
  final String dosen;
  final String counter;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idDosen: json["id_dosen"] == null ? null : json["id_dosen"],
        dosen: json["dosen"] == null ? null : json["dosen"],
        counter: json["counter"] == null ? null : json["counter"],
      );
}
