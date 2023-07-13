// To parse this JSON data, do
//
//     final check = checkFromJson(jsonString);

// To parse this JSON data, do
//
//     final tagihanModel = tagihanModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final riwayatBayar = riwayatBayarFromJson(jsonString);

import 'dart:convert';

RiwayatBayar riwayatBayarFromJson(String str) =>
    RiwayatBayar.fromJson(json.decode(str));

class RiwayatBayar {
  RiwayatBayar({
    required this.data,
    required this.total,
    required this.error,
  });

  final List<Datum>? data;
  final int total;
  final bool error;

  factory RiwayatBayar.fromJson(Map<String, dynamic> json) => RiwayatBayar(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
        error: json["error"] == null ? null : json["error"],
      );
}

class Datum {
  Datum({
    required this.namaMhs,
    required this.nim,
    required this.jenjang,
    required this.prodi,
    required this.fakultas,
    required this.jenisPembayaran,
    required this.codeTrans,
    required this.periodeAjaran,
    required this.nominal,
    required this.dibuat,
    required this.id,
  });

  final String namaMhs;
  final String nim;
  final String jenjang;
  final String prodi;
  final String fakultas;
  final String jenisPembayaran;
  final String codeTrans;
  final String periodeAjaran;
  final String nominal;
  final DateTime? dibuat;
  final String id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        namaMhs: json["nama_mhs"] == null ? null : json["nama_mhs"],
        nim: json["nim"] == null ? null : json["nim"],
        jenjang: json["jenjang"] == null ? null : json["jenjang"],
        prodi: json["prodi"] == null ? null : json["prodi"],
        fakultas: json["fakultas"] == null ? null : json["fakultas"],
        jenisPembayaran:
            json["jenis_pembayaran"] == null ? null : json["jenis_pembayaran"],
        codeTrans: json["code_trans"] == null ? null : json["code_trans"],
        periodeAjaran:
            json["periode_ajaran"] == null ? null : json["periode_ajaran"],
        nominal: json["nominal"] == null ? null : json["nominal"],
        dibuat: json["dibuat"] == null
            ? DateTime.now()
            : DateTime.parse(json["dibuat"]),
        id: json["id"] == null ? null : json["id"],
      );
}

UnduhBuktiModel unduhBuktiModelFromJson(String str) =>
    UnduhBuktiModel.fromJson(json.decode(str));

String unduhBuktiModelToJson(UnduhBuktiModel data) =>
    json.encode(data.toJson());

class UnduhBuktiModel {
  UnduhBuktiModel({
    required this.error,
    required this.file,
  });

  final bool error;
  final String file;

  factory UnduhBuktiModel.fromJson(Map<String, dynamic> json) =>
      UnduhBuktiModel(
        error: json["error"] == null ? null : json["error"],
        file: json["file"] == null ? null : json["file"],
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "file": file == null ? null : file,
      };
}
