// To parse this JSON data, do
//
//     final ubb = ubbFromJson(jsonString);

import 'dart:convert';

Ubb ubbFromJson(String str) => Ubb.fromJson(json.decode(str));

class Ubb {
  Ubb({
    required this.data,
    required this.error,
    required this.total,
  });

  final List<Datum> data;
  final bool error;
  final int total;

  factory Ubb.fromJson(Map<String, dynamic> json) => Ubb(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
        total: json["total"],
      );
}

class Datum {
  Datum(
      {required this.id,
      required this.name,
      required this.isConfirm,
      required this.codeTrans,
      required this.nim,
      required this.note,
      required this.noteReject,
      required this.nominal,
      required this.uploads,
      required this.dibuat});

  final String id;
  final String name;
  final String isConfirm;
  final String codeTrans;
  final String nim;
  final String note;
  final dynamic noteReject;
  final String nominal;
  final dynamic uploads;
  final DateTime? dibuat;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        isConfirm: json["is_confirm"],
        codeTrans: json["code_trans"],
        nim: json["nim"],
        note: json["note"],
        noteReject: json["note_reject"],
        nominal: json["nominal"],
        uploads: json["uploads"],
        dibuat: json["dibuat"] == null
            ? DateTime.now()
            : DateTime.parse(json["dibuat"]),
      );
}
