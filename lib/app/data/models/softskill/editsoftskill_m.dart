// To parse this JSON data, do
//
//     final editSoftSkillModel = editSoftSkillModelFromJson(jsonString);

import 'dart:convert';

EditSoftSkillModel editSoftSkillModelFromJson(String str) => EditSoftSkillModel.fromJson(json.decode(str));

String editSoftSkillModelToJson(EditSoftSkillModel data) => json.encode(data.toJson());

class EditSoftSkillModel {
    EditSoftSkillModel({
        required this.error,
        required this.data,
    });

    bool error;
    Data data;

    factory EditSoftSkillModel.fromJson(Map<String, dynamic> json) => EditSoftSkillModel(
        error: json["error"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.nim,
        required this.date,
        required this.name,
        required this.note,
        required this.createdDate,
        required this.createdBy,
        required this.file,
        required this.status,
        this.updatedDate,
        this.updatedBy,
        required this.idPeriode,
        required this.nilaiAngka,
        required this.nilaiHuruf,
        required this.periode,
    });

    String id;
    String nim;
    DateTime date;
    String name;
    String note;
    DateTime createdDate;
    String createdBy;
    String file;
    String status;
    dynamic updatedDate;
    dynamic updatedBy;
    String idPeriode;
    String nilaiAngka;
    String nilaiHuruf;
    String periode;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nim: json["nim"],
        date: DateTime.parse(json["date"]),
        name: json["name"],
        note: json["note"],
        createdDate: DateTime.parse(json["created_date"]),
        createdBy: json["created_by"],
        file: json["file"],
        status: json["status"],
        updatedDate: json["updated_date"],
        updatedBy: json["updated_by"],
        idPeriode: json["id_periode"],
        nilaiAngka: json["nilai_angka"],
        nilaiHuruf: json["nilai_huruf"],
        periode: json["periode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nim": nim,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "name": name,
        "note": note,
        "created_date": createdDate.toIso8601String(),
        "created_by": createdBy,
        "file": file,
        "status": status,
        "updated_date": updatedDate,
        "updated_by": updatedBy,
        "id_periode": idPeriode,
        "nilai_angka": nilaiAngka,
        "nilai_huruf": nilaiHuruf,
        "periode": periode,
    };
}
