// To parse this JSON data, do
//
//     final chatKaryawanModel = chatKaryawanModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChatKaryawanModel chatKaryawanModelFromJson(String str) =>
    ChatKaryawanModel.fromJson(json.decode(str));

class ChatKaryawanModel {
  ChatKaryawanModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum>? data;
  final int total;

  factory ChatKaryawanModel.fromJson(Map<String, dynamic> json) =>
      ChatKaryawanModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum(
      {required this.idPosisi,
      required this.namaPosisi,
      required this.counter,
      required this.chat,
      required this.dateChat});

  final String idPosisi;
  final String namaPosisi;
  final String counter;
  final String chat;
  final String dateChat;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idPosisi: json["id_posisi"] == null ? null : json["id_posisi"],
        namaPosisi: json["nama_posisi"] == null ? null : json["nama_posisi"],
        counter: json["counter"] == null ? "" : json["counter"],
        chat: json["chat"] == null ? "" : json["chat"],
        dateChat: json["date_chat"] == null ? "" : json["date_chat"],
      );
}
