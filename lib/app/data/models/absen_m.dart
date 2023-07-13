// To parse this JSON data, do
//
//     final absensiModel = absensiModelFromJson(jsonString);

import 'dart:convert';

AbsensiModel absensiModelFromJson(String str) =>
    AbsensiModel.fromJson(json.decode(str));

class AbsensiModel {
  AbsensiModel({
    required this.data,
    required this.total,
    required this.error,
  });

  final List<AbsensiModelDatum>? data;
  final int total;
  final bool error;

  factory AbsensiModel.fromJson(Map<String, dynamic> json) => AbsensiModel(
        data: json["data"] == null
            ? null
            : List<AbsensiModelDatum>.from(
                json["data"].map((x) => AbsensiModelDatum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
        error: json["error"] == null ? null : json["error"],
      );
}

class AbsensiModelDatum {
  AbsensiModelDatum({
    required this.tahun,
    required this.data,
    required this.total,
  });

  final String tahun;
  final List<PurpleDatum>? data;
  final int total;

  factory AbsensiModelDatum.fromJson(Map<String, dynamic> json) =>
      AbsensiModelDatum(
        tahun: json["tahun"] == null ? null : json["tahun"],
        data: json["data"] == null
            ? null
            : List<PurpleDatum>.from(
                json["data"].map((x) => PurpleDatum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class PurpleDatum {
  PurpleDatum({
    required this.bulanTahun,
    required this.data,
    required this.total,
  });

  final String bulanTahun;
  final List<FluffyDatum>? data;
  final int total;

  factory PurpleDatum.fromJson(Map<String, dynamic> json) => PurpleDatum(
        bulanTahun: json["bulan_tahun"] == null ? null : json["bulan_tahun"],
        data: json["data"] == null
            ? null
            : List<FluffyDatum>.from(
                json["data"].map((x) => FluffyDatum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class FluffyDatum {
  FluffyDatum({
    required this.tanggal,
    required this.hari,
    required this.date,
    required this.matkul,
    required this.kelas,
    required this.dosen,
    required this.startTime,
    required this.endTime,
    required this.statusKelas,
    required this.statusAbsensi,
    required this.tipeKelas,
  });

  final String tanggal;
  final String hari;
  final DateTime? date;
  final String matkul;
  final String kelas;
  final String dosen;
  final String startTime;
  final String endTime;
  final String statusKelas;
  final String? statusAbsensi;
  final String tipeKelas;

  factory FluffyDatum.fromJson(Map<String, dynamic> json) => FluffyDatum(
        tanggal: json["tanggal"] == null ? null : json["tanggal"],
        hari: json["hari"] == null ? null : json["hari"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        matkul: json["matkul"] == null ? null : json["matkul"],
        kelas: json["kelas"] == null ? null : json["kelas"],
        dosen: json["dosen"] == null ? null : json["dosen"],
        startTime: json["start_time"] == null ? null : json["start_time"],
        endTime: json["end_time"] == null ? null : json["end_time"],
        statusKelas: json["status_kelas"] == null ? null : json["status_kelas"],
        statusAbsensi:
            json["status_absensi"] == null ? null : json["status_absensi"],
        tipeKelas: json["tipe_kelas"] == null ? null : json["tipe_kelas"],
      );
}
