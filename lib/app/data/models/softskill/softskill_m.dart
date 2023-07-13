// To parse this JSON data, do
//
//     final softSkill = softSkillFromJson(jsonString);

import 'dart:convert';



SoftSkillModel softSkillFromJson(String str) => SoftSkillModel.fromJson(json.decode(str));

class SoftSkillModel {
  SoftSkillModel({
    required this.data,
    required this.error,
  });

  final List<Datum>? data;
  final bool error;

  factory SoftSkillModel.fromJson(Map<String, dynamic> json) => SoftSkillModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
      );
}

class Datum{
    Datum({
        required this.idPeriode,
        required this.periode,
        required this.nilaiAngka,
        required this.nilaiHuruf,
        required this.id,
        required this.name,
        required this.date,
        required this.note,
        required this.status,
        required this.labelStatus,
        required this.noteStatus,
        required this.admin,
        required this.file,
        required this.typeFile,
    });

    dynamic idPeriode;
    dynamic periode;
    dynamic nilaiAngka;
    dynamic nilaiHuruf;
    final String id;
    final String name;
    final DateTime date;
    final String note;
    final String status;
    final String labelStatus;
    final String noteStatus;
    final String admin;
    final String file;
    final String typeFile;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idPeriode: json["id_periode"],
        periode: json["periode"],
        nilaiAngka: json["nilai_angka"],
        nilaiHuruf: json["nilai_huruf"],
        id: json["id"],
        name: json["name"],
        date: DateTime.parse(json["date"]),
        note: json["note"],
        status: json["status"],
        labelStatus: json["label_status"],
        noteStatus: json["note_status"],
        admin: json["admin"],
        file: json["file"],
        typeFile: json["type_file"],
    );
}