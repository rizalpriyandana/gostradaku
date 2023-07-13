// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

class ProfileModel {
  ProfileModel({
    required this.data,
    required this.error,
  });

  final List<Datum>? data;
  final bool error;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
      );
}

class Datum {
  Datum({
    required this.id,
    required this.nim,
    required this.nama,
    required this.fakultas,
    required this.prodi,
    required this.gender,
    required this.username,
    required this.photo,
  });
  final String id;
  final String nim;
  final String nama;
  final String fakultas;
  final String prodi;
  final String gender;
  final String username;
  final String photo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        nim: json["nim"] == null ? null : json["nim"],
        nama: json["nama"] == null ? null : json["nama"],
        fakultas: json["fakultas"] == null ? null : json["fakultas"],
        prodi: json["prodi"] == null ? null : json["prodi"],
        gender: json["gender"] == null ? null : json["gender"],
        username: json["username"] == null ? null : json["username"],
        photo: json["photo"] == null ? null : json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nik": nim == null ? null : nim,
        "nama": nama == null ? null : nama,
        "fakultas": fakultas == null ? null : fakultas,
        "prodi": prodi == null ? null : prodi,
        "gender": gender == null ? null : gender,
        "username": username == null ? null : username,
        "photo": photo == null ? null : photo,
      };
}
