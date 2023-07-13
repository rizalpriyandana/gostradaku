// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

class ChatModel {
  ChatModel({
    required this.data,
    required this.total,
  });

  final List<Message>? data;
  final int? total;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        data: json["data"] == null
            ? null
            : List<Message>.from(json["data"].map((x) => Message.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Message {
  Message({
    required this.nim,
    required this.sender,
    required this.dosen,
    required this.dateChat,
    required this.content,
    required this.userRead,
    required this.adminRead,
  });

  final String nim;
  final String sender;
  final String? dosen;
  final DateTime? dateChat;
  final String content;
  final String userRead;
  final String adminRead;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        nim: json["nim"] == null ? null : json["nim"],
        sender: json["sender"] == null ? null : json["sender"],
        dosen: json["dosen"] == null ? null : json["dosen"],
        dateChat: json["date_chat"] == null
            ? null
            : DateTime.parse(json["date_chat"]),
        content: json["content"] == null ? null : json["content"],
        userRead: json["user_read"] == null ? "" : json["user_read"],
        adminRead: json["admin_read"] == null ? null : json["admin_read"],
      );
}
// To parse this JSON data, do
//
//     final chatEmployeeModel = chatEmployeeModelFromJson(jsonString);



