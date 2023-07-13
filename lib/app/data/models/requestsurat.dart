
import 'dart:convert';

DataRequestModel dataRequestModelFromJson(String str) =>
    DataRequestModel.fromJson(json.decode(str));

class DataRequestModel {
  DataRequestModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum>? data;
  final int total;

  factory DataRequestModel.fromJson(Map<String, dynamic> json) =>
      DataRequestModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum({
    required this.idJenisSurat,
    required this.jenisSurat,
  });

  final String idJenisSurat;
  final String jenisSurat;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idJenisSurat:
            json["id_jenis_surat"] == null ? null : json["id_jenis_surat"],
        jenisSurat: json["jenis_surat"] == null ? null : json["jenis_surat"],
      );

  Map<String, dynamic> toJson() => {
        "id_jenis_surat": idJenisSurat == null ? null : idJenisSurat,
        "jenis_surat": jenisSurat == null ? null : jenisSurat,
      };
}

// To parse this JSON data, do
//
//     final suratModel = suratModelFromJson(jsonString);

SuratModel suratModelFromJson(String str) =>
    SuratModel.fromJson(json.decode(str));

class SuratModel {
  SuratModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datumsurat>? data;
  final int total;

  factory SuratModel.fromJson(Map<String, dynamic> json) => SuratModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datumsurat>.from(
                json["data"].map((x) => Datumsurat.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datumsurat {
  Datumsurat({
    required this.key,
  });

  final String key;

  factory Datumsurat.fromJson(Map<String, dynamic> json) => Datumsurat(
        key: json["key"] == null ? null : json["key"],
      );
}

// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

HistorySurat historyFromJson(String str) =>
    HistorySurat.fromJson(json.decode(str));

class HistorySurat {
  HistorySurat({
    required this.data,
    required this.total,
  });

  final List<Datumriwayat>? data;
  final int total;

  factory HistorySurat.fromJson(Map<String, dynamic> json) => HistorySurat(
        data: json["data"] == null
            ? null
            : List<Datumriwayat>.from(
                json["data"].map((x) => Datumriwayat.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datumriwayat {
  Datumriwayat({
    required this.surat,
    required this.statusSurat,
    required this.nomorSurat,
  });

  final String surat;
  final String statusSurat;
  final String nomorSurat;

  factory Datumriwayat.fromJson(Map<String, dynamic> json) => Datumriwayat(
        surat: json["surat"] == null ? null : json["surat"],
        statusSurat: json["status_surat"] == null ? null : json["status_surat"],
        nomorSurat: json["nomor_surat"] == null ? null : json["nomor_surat"],
      );
}

HistorydetailModel historydetailModelFromJson(String str) =>
    HistorydetailModel.fromJson(json.decode(str));

class HistorydetailModel {
  HistorydetailModel(
      {required this.surat,
      required this.data,
      required this.catatan,
      required this.error,
      required this.total,
      required this.unduh});

  final String surat;
  final List<Datumdetail>? data;
  final String catatan;
  final bool error;
  final int total;
  final String unduh;

  factory HistorydetailModel.fromJson(Map<String, dynamic> json) =>
      HistorydetailModel(
        surat: json["surat"] == null ? '' : json["surat"],
        data: json["data"] == null
            ? null
            : List<Datumdetail>.from(
                json["data"].map((x) => Datumdetail.fromJson(x))),
        catatan: json["catatan"] == null ? "" : json["catatan"],
        error: json["error"] == null ? false : json["error"],
        total: json["total"] == null ? 0 : json["total"],
        unduh: json["unduh"] == null ? "" : json["unduh"],
      );
}

class Datumdetail {
  Datumdetail({
    required this.tanggalInput,
    required this.tanggalKeluar,
    required this.status,
  });

  final String tanggalInput;
  final String tanggalKeluar;
  final String status;

  factory Datumdetail.fromJson(Map<String, dynamic> json) => Datumdetail(
        tanggalInput:
            json["tanggal_input"] == null ? "" : json["tanggal_input"],
        tanggalKeluar:
            json["tanggal_keluar"] == null ? "" : json["tanggal_keluar"],
        status: json["status"] == null ? "" : json["status"],
      );
}
// To parse this JSON data, do
//
//     final unduhmodel = unduhmodelFromJson(jsonString);

Unduhmodel unduhmodelFromJson(String str) =>
    Unduhmodel.fromJson(json.decode(str));

class Unduhmodel {
  Unduhmodel({
    required this.error,
    required this.file,
  });

  final bool error;
  final String file;

  factory Unduhmodel.fromJson(Map<String, dynamic> json) => Unduhmodel(
        error: json["error"] == null ? null : json["error"],
        file: json["file"] == null ? null : json["file"],
      );

  Map<String, dynamic> toJson() => {
        "error": error == null ? null : error,
        "file": file == null ? null : file,
      };
}
