// To parse this JSON data, do
//
//     final yudisiummodel = yudisiummodelFromJson(jsonString);


import 'dart:convert';

Yudisiummodel yudisiummodelFromJson(String str) =>
    Yudisiummodel.fromJson(json.decode(str));

class Yudisiummodel {
  Yudisiummodel({
    required this.error,
    required this.yudisium,
    required this.status,
  });

  final bool error;
  final List<Yudisium>? yudisium;
  final String status;

  factory Yudisiummodel.fromJson(Map<String, dynamic> json) => Yudisiummodel(
        error: json["error"] == null ? null : json["error"],
        yudisium: json["yudisium"] == null
            ? null
            : List<Yudisium>.from(
                json["yudisium"].map((x) => Yudisium.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
      );
}

class Yudisium {
  Yudisium({
    required this.fakultas,
    required this.prodi,
    required this.namaMhs,
    required this.nim,
    required this.judulSkripsi,
    required this.dateYudisium,
    required this.noSk,
    required this.tglSk,
    required this.noIjazah,
    required this.noTranskip,
  });

  final String fakultas;
  final String prodi;
  final String namaMhs;
  final String nim;
  final String judulSkripsi;
  final DateTime? dateYudisium;
  final String noSk;
  final DateTime? tglSk;
  final String noIjazah;
  final String noTranskip;

  factory Yudisium.fromJson(Map<String, dynamic> json) => Yudisium(
        fakultas: json["fakultas"] == null ? null : json["fakultas"],
        prodi: json["prodi"] == null ? null : json["prodi"],
        namaMhs: json["nama_mhs"] == null ? null : json["nama_mhs"],
        nim: json["nim"] == null ? null : json["nim"],
        judulSkripsi:
            json["judul_skripsi"] == null ? null : json["judul_skripsi"],
        dateYudisium: json["date_yudisium"] == null
            ? null
            : DateTime.parse(json["date_yudisium"]),
        noSk: json["no_sk"] == null ? null : json["no_sk"],
        tglSk: json["tgl_sk"] == null ? null : DateTime.parse(json["tgl_sk"]),
        noIjazah: json["no_ijazah"] == null ? null : json["no_ijazah"],
        noTranskip: json["no_transkip"] == null ? null : json["no_transkip"],
      );
}
