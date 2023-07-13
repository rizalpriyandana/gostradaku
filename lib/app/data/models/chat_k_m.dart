import 'dart:convert';

ChatEmployeeModel chatEmployeeModelFromJson(String str) =>
    ChatEmployeeModel.fromJson(json.decode(str));

class ChatEmployeeModel {
  ChatEmployeeModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Message1>? data;
  final int total;

  factory ChatEmployeeModel.fromJson(Map<String, dynamic> json) =>
      ChatEmployeeModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Message1>.from(
                json["data"].map((x) => Message1.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Message1 {
  Message1({
    required this.nim,
    required this.idAdmin,
    required this.pegawai,
    required this.idPosition,
    required this.bagian,
    required this.sender,
    required this.dateChat,
    required this.content,
    required this.adminRead,
  });

  final String nim;
  final String idAdmin;
  final String pegawai;
  final String idPosition;
  final String bagian;
  final String sender;
  final DateTime? dateChat;
  final String content;
  final String adminRead;

  factory Message1.fromJson(Map<String, dynamic> json) => Message1(
        nim: json["nim"] == null ? "" : json["nim"],
        idAdmin: json["id_admin"] == null ? "" : json["id_admin"],
        pegawai: json["pegawai"] == null ? "" : json["pegawai"],
        idPosition: json["id_position"] == null ? "" : json["id_position"],
        bagian: json["bagian"] == null ? "" : json["bagian"],
        sender: json["sender"] == null ? "" : json["sender"],
        dateChat: json["date_chat"] == null
            ? null
            : DateTime.parse(json["date_chat"]),
        content: json["content"] == null ? "" : json["content"],
        adminRead: json["admin_read"] == null ? "" : json["admin_read"],
      );
}
