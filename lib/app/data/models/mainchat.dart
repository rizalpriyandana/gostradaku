// To parse this JSON data, do
//
//     final ChatAllModel = ChatAllModelFromJson(jsonString);


import 'dart:convert';

ChatAllModel ChatAllModelFromJson(String str) =>
    ChatAllModel.fromJson(json.decode(str));

class ChatAllModel {
  ChatAllModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum>? data;
  final int total;

  factory ChatAllModel.fromJson(Map<String, dynamic> json) => ChatAllModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum({
    required this.nim,
    required this.idAdmin,
    required this.dosen,
    required this.photo,
    required this.chat,
    required this.dateChat,
    required this.counter,
    required this.sender,
    required this.idPosisi,
    required this.namaPosisi,
  });

  final String nim;
  final String idAdmin;
  final String dosen;
  final String photo;
  final String chat;
  final String dateChat;
  final String counter;
  final String sender;
  final String idPosisi;
  final String namaPosisi;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nim: json["nim"] == null ? "" : json["nim"],
        idAdmin: json["id_admin"] == null ? "" : json["id_admin"],
        dosen: json["dosen"] == null ? "" : json["dosen"],
        photo: json["photo"] == null ? "" : json["photo"],
        chat: json["chat"] == null ? "" : json["chat"],
        dateChat: json["date_chat"] == null ? "" : json["date_chat"],
        counter: json["counter"] == null ? "" : json["counter"],
        sender: json["sender"] == null ? "" : json["sender"],
        idPosisi: json["id_posisi"] == null ? "" : json["id_posisi"],
        namaPosisi: json["nama_posisi"] == null ? "" : json["nama_posisi"],
      );
}
