// To parse this JSON data, do
//
//     final chatListDosenModel = chatListDosenModelFromJson(jsonString);


import 'dart:convert';

ChatDosenModel chatDosenModelFromJson(String str) =>
    ChatDosenModel.fromJson(json.decode(str));

class ChatDosenModel {
  ChatDosenModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum>? data;
  final int total;

  factory ChatDosenModel.fromJson(Map<String, dynamic> json) => ChatDosenModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum({
    required this.id,
    required this.photo,
    required this.dosen,
    required this.chat,
    required this.dateChat,
    required this.counter,
    required this.sender,
  });

  final String id;
  final String photo;
  final String dosen;
  final String chat;
  final String dateChat;
  final String counter;
  final String sender;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? "" : json["id"],
        photo: json["photo"] == null ? "" : json["photo"],
        dosen: json["dosen"] == null ? "" : json["dosen"],
        chat: json["chat"] == null ? "" : json["chat"],
        dateChat: json["date_chat"] == null ? "" : json["date_chat"],
        counter: json["counter"] == null ? "" : json["counter"],
        sender: json["sender"] == null ? "" : json["sender"],
      );
}
