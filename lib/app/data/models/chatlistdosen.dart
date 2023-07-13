// To parse this JSON data, do
//
//     final chatListDosenModel = chatListDosenModelFromJson(jsonString);


import 'dart:convert';

ChatListDosenModel chatListDosenModelFromJson(String str) =>
    ChatListDosenModel.fromJson(json.decode(str));

class ChatListDosenModel {
  ChatListDosenModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum>? data;
  final int total;

  factory ChatListDosenModel.fromJson(Map<String, dynamic> json) =>
      ChatListDosenModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum({
    required this.idAdmin,
    required this.photo,
    required this.dosen,
    required this.posisi,
    required this.chat,
    required this.dateChat,
    required this.counter,
    required this.sender,
  });

  final String idAdmin;
  final String photo;
  final String dosen;
  final String posisi;
  final String chat;
  final String dateChat;
  final String counter;
  final String sender;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idAdmin: json["id_admin"] == null ? null : json["id_admin"],
        photo: json["photo"] == null ? null : json["photo"],
        dosen: json["dosen"] == null ? null : json["dosen"],
        posisi: json["posisi"] == null ? null : json["posisi"],
        chat: json["chat"] == null ? null : json["chat"],
        dateChat: json["date_chat"] == null ? null : json["date_chat"],
        counter: json["counter"] == null ? null : json["counter"],
        sender: json["sender"] == null ? null : json["sender"],
      );
}
