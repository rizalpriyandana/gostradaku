// To parse this JSON data, do
//
//     final jadwalAbsensiModel = jadwalAbsensiModelFromJson(jsonString);

import 'dart:convert';

JadwalAbsensiModel jadwalAbsensiModelFromJson(String str) =>
    JadwalAbsensiModel.fromJson(json.decode(str));

class JadwalAbsensiModel {
  JadwalAbsensiModel({
    required this.jadwalKuliah,
    required this.absensi,
    required this.error,
  });

  final JadwalKuliah? jadwalKuliah;
  final Absensi? absensi;
  final bool error;

  factory JadwalAbsensiModel.fromJson(Map<String, dynamic> json) =>
      JadwalAbsensiModel(
        jadwalKuliah: json["jadwal_kuliah"] == null
            ? null
            : JadwalKuliah.fromJson(json["jadwal_kuliah"]),
        absensi:
            json["absensi"] == null ? null : Absensi.fromJson(json["absensi"]),
        error: json["error"] == null ? null : json["error"],
      );
}

class Absensi {
  Absensi({
    required this.data,
    required this.total,
  });

  final List<AbsensiDatum>? data;
  final int total;

  factory Absensi.fromJson(Map<String, dynamic> json) => Absensi(
        data: json["data"] == null
            ? null
            : List<AbsensiDatum>.from(
                json["data"].map((x) => AbsensiDatum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class AbsensiDatum {
  AbsensiDatum({
    required this.matkul,
    required this.date,
    required this.jam,
  });

  final String matkul;
  final DateTime? date;
  final String jam;

  factory AbsensiDatum.fromJson(Map<String, dynamic> json) => AbsensiDatum(
        matkul: json["matkul"] == null ? null : json["matkul"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        jam: json["jam"] == null ? null : json["jam"],
      );
}

class JadwalKuliah {
  JadwalKuliah({
    required this.data,
    required this.total,
  });

  final List<JadwalKuliahDatum>? data;
  final int total;

  factory JadwalKuliah.fromJson(Map<String, dynamic> json) => JadwalKuliah(
        data: json["data"] == null
            ? null
            : List<JadwalKuliahDatum>.from(
                json["data"].map((x) => JadwalKuliahDatum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class JadwalKuliahDatum {
  JadwalKuliahDatum(
      {required this.matkul,
      required this.ruangan,
      required this.materi,
      required this.codeMk,
      required this.dosen,
      required this.tanggal,
      required this.jam,
      required this.jenisJadwal});

  final String matkul;
  final String? ruangan;
  final String materi;
  final String codeMk;
  final String dosen;
  final DateTime tanggal;
  final String jam;
  final String jenisJadwal;

  factory JadwalKuliahDatum.fromJson(Map<String, dynamic> json) =>
      JadwalKuliahDatum(
        matkul: json["matkul"] == null ? "" : json["matkul"],
        ruangan: json["ruangan"] == null ? "" : json["ruangan"],
        materi: json["materi"] == null ? "" : json["materi"],
        codeMk: json["code_mk"] == null ? "" : json["code_mk"],
        dosen: json["dosen"] == null ? "" : json["dosen"],
        tanggal: DateTime.parse(json["tanggal"]),
        jam: json["jam"] == null ? "" : json["jam"],
        jenisJadwal: json["jenis_jadwal"] == null ? "" : json["jenis_jadwal"],
      );
}
