// To parse this JSON data, do
//
//     final dosenPembimbingprofile = dosenPembimbingprofileFromJson(jsonString);


import 'dart:convert';

DosenPembimbingprofile dosenPembimbingprofileFromJson(String str) =>
    DosenPembimbingprofile.fromJson(json.decode(str));

class DosenPembimbingprofile {
  DosenPembimbingprofile({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final Data? data;
  final int total;

  factory DosenPembimbingprofile.fromJson(Map<String, dynamic> json) =>
      DosenPembimbingprofile(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        total: json["total"] == null ? null : json["total"],
      );
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.photo,
  });

  final String id;
  final String name;
  final String photo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        photo: json["photo"] == null ? null : json["photo"],
      );
}

// To parse this JSON data, do
//
//     final listDosenPembimbingChat = listDosenPembimbingChatFromJson(jsonString);

ListDosenPembimbingChat listDosenPembimbingChatFromJson(String str) =>
    ListDosenPembimbingChat.fromJson(json.decode(str));

class ListDosenPembimbingChat {
  ListDosenPembimbingChat({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<MessagePembimbing>? data;
  final int total;

  factory ListDosenPembimbingChat.fromJson(Map<String, dynamic> json) =>
      ListDosenPembimbingChat(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<MessagePembimbing>.from(
                json["data"].map((x) => MessagePembimbing.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class MessagePembimbing {
  MessagePembimbing(
      {required this.nim,
      required this.idPesan,
      required this.idAdmin,
      required this.dosen,
      required this.sender,
      required this.dateChat,
      required this.content,
      required this.adminRead,
      required this.uploads,
      required this.reply});

  final String nim;
  final String idPesan;
  final String idAdmin;
  final String dosen;
  final String sender;
  final DateTime? dateChat;
  final String content;
  final String adminRead;
  final String uploads;
  final String reply;

  factory MessagePembimbing.fromJson(Map<String, dynamic> json) =>
      MessagePembimbing(
        nim: json["nim"] == null ? "" : json["nim"],
        idPesan: json["id_pesan"] == null ? "" : json["id_pesan"],
        idAdmin: json["id_admin"] == null ? "" : json["id_admin"],
        dosen: json["dosen"] == null ? "" : json["dosen"],
        sender: json["sender"] == null ? "" : json["sender"],
        dateChat: json["date_chat"] == null
            ? null
            : DateTime.parse(json["date_chat"]),
        content: json["content"] == null ? "" : json["content"],
        adminRead: json["admin_read"] == null ? "" : json["admin_read"],
        uploads: json["uploads"] == null ? "" : json["uploads"],
        reply: json["reply"] == null ? "" : json["reply"],
      );
}
