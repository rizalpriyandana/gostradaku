// To parse this JSON data, do
//
//     final chatMasterModel = chatMasterModelFromJson(jsonString);


import 'dart:convert';

ChatMasterModel chatMasterModelFromJson(String str) =>
    ChatMasterModel.fromJson(json.decode(str));

class ChatMasterModel {
  ChatMasterModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum>? data;
  final int total;

  factory ChatMasterModel.fromJson(Map<String, dynamic> json) =>
      ChatMasterModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum({
    required this.idPosisi,
    required this.namaPosisi,
  });

  final String idPosisi;
  final String namaPosisi;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idPosisi: json["id_posisi"] == null ? null : json["id_posisi"],
        namaPosisi: json["nama_posisi"] == null ? null : json["nama_posisi"],
      );
}
