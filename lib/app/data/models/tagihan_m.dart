// To parse this JSON data, do
//
//     final tagihanModel = tagihanModelFromJson(jsonString);

import 'dart:convert';

TagihanModel tagihanModelFromJson(String str) =>
    TagihanModel.fromJson(json.decode(str));

class TagihanModel {
  TagihanModel({
    required this.namaTagihan,
    required this.status,
    required this.tagihanCicilan,
    required this.tagihanSemester,
    required this.tagihanActive,
    required this.tagihanExpired,
    required this.error,
  });

  final String? namaTagihan;
  final int status;
  final TagihanCicilan? tagihanCicilan;
  final TagihanSemester? tagihanSemester;
  final TagihanActive? tagihanActive;
  final TagihanExpired? tagihanExpired;
  final bool error;

  factory TagihanModel.fromJson(Map<String, dynamic> json) => TagihanModel(
        namaTagihan: json["nama_tagihan"] == null ? null : json["nama_tagihan"],
        status: json["status"] == null ? null : json["status"],
        tagihanCicilan: json["tagihan_cicilan"] == null
            ? null
            : TagihanCicilan.fromJson(json["tagihan_cicilan"]),
        tagihanSemester: json["tagihan_semester"] == null
            ? null
            : TagihanSemester.fromJson(json["tagihan_semester"]),
        tagihanActive: json["tagihan_active"] == null
            ? null
            : TagihanActive.fromJson(json["tagihan_active"]),
        tagihanExpired: json["tagihan_expired"] == null
            ? null
            : TagihanExpired.fromJson(json["tagihan_expired"]),
        error: json["error"] == null ? null : json["error"],
      );
}

class TagihanActive {
  TagihanActive({
    required this.data,
    required this.activeTagihan,
  });

  final List<TagihanActiveDatum>? data;
  final int activeTagihan;

  factory TagihanActive.fromJson(Map<String, dynamic> json) => TagihanActive(
        data: json["data"] == null
            ? null
            : List<TagihanActiveDatum>.from(
                json["data"].map((x) => TagihanActiveDatum.fromJson(x))),
        activeTagihan:
            json["active_tagihan"] == null ? null : json["active_tagihan"],
      );
}

class TagihanActiveDatum {
  TagihanActiveDatum({
    required this.codeTrans,
    required this.nominal,
    required this.tanggalDibuat,
    required this.tanggalExpired,
  });

  final String codeTrans;
  final int nominal;
  final String tanggalDibuat;
  final String tanggalExpired;

  factory TagihanActiveDatum.fromJson(Map<String, dynamic> json) =>
      TagihanActiveDatum(
        codeTrans: json["code_trans"] == null ? null : json["code_trans"],
        nominal: json["nominal"] == null ? null : json["nominal"],
        tanggalDibuat:
            json["tanggal_dibuat"] == null ? null : json["tanggal_dibuat"],
        tanggalExpired:
            json["tanggal_expired"] == null ? null : json["tanggal_expired"],
      );

  Map<String, dynamic> toJson() => {
        "code_trans": codeTrans == null ? null : codeTrans,
        "nominal": nominal == null ? null : nominal,
        "tanggal_dibuat": tanggalDibuat == null ? null : tanggalDibuat,
        "tanggal_expired": tanggalExpired == null ? null : tanggalExpired,
      };
}

class TagihanCicilan {
  TagihanCicilan({
    required this.data,
    required this.contentCicilan,
  });

  final List<TagihanCicilanDatum>? data;
  final int contentCicilan;

  factory TagihanCicilan.fromJson(Map<String, dynamic> json) => TagihanCicilan(
        data: json["data"] == null
            ? null
            : List<TagihanCicilanDatum>.from(
                json["data"].map((x) => TagihanCicilanDatum.fromJson(x))),
        contentCicilan:
            json["content_cicilan"] == null ? null : json["content_cicilan"],
      );
}

class TagihanCicilanDatum {
  TagihanCicilanDatum({
    required this.nama,
    required this.nominal,
    required this.total,
    required this.terbayar,
    required this.semester,
  });

  final String? nama;
  final int? nominal;
  final int? total;
  final int? terbayar;
  final int? semester;

  factory TagihanCicilanDatum.fromJson(Map<String, dynamic> json) =>
      TagihanCicilanDatum(
        nama: json["nama"] == null ? null : json["nama"],
        nominal: json["nominal"] == null ? null : json["nominal"],
        total: json["total"] == null ? null : json["total"],
        terbayar: json["terbayar"] == null ? null : json["terbayar"],
        semester: json["semester"] == null ? null : json["semester"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama == null ? null : nama,
        "nominal": nominal == null ? null : nominal,
        "total": total == null ? null : total,
        "terbayar": terbayar == null ? null : terbayar,
        "semester": semester == null ? null : semester,
      };
}

class TagihanExpired {
  TagihanExpired({
    required this.data,
    required this.tagihanExpired,
  });

  final List<TagihanActiveDatum>? data;
  final int tagihanExpired;

  factory TagihanExpired.fromJson(Map<String, dynamic> json) => TagihanExpired(
        data: json["data"] == null
            ? null
            : List<TagihanActiveDatum>.from(
                json["data"].map((x) => TagihanActiveDatum.fromJson(x))),
        tagihanExpired:
            json["tagihan_expired"] == null ? null : json["tagihan_expired"],
      );
}

class TagihanSemester {
  TagihanSemester({
    required this.data,
    required this.contentTagihan,
  });

  final List<TagihanCicilanDatum>? data;
  final int contentTagihan;

  factory TagihanSemester.fromJson(Map<String, dynamic> json) =>
      TagihanSemester(
        data: json["data"] == null
            ? null
            : List<TagihanCicilanDatum>.from(
                json["data"].map((x) => TagihanCicilanDatum.fromJson(x))),
        contentTagihan:
            json["content_tagihan"] == null ? null : json["content_tagihan"],
      );
}

GetCreditModel getCreditModelFromJson(String str) =>
    GetCreditModel.fromJson(json.decode(str));

String getCreditModelToJson(GetCreditModel data) => json.encode(data.toJson());

class GetCreditModel {
  GetCreditModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum> data;
  final int total;

  factory GetCreditModel.fromJson(Map<String, dynamic> json) => GetCreditModel(
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

//loadtagihan

// To parse this JSON data, do
//
//     final loadTagihanModel = loadTagihanModelFromJson(jsonString);

BuatTagihanModel buatTagihanModelFromJson(String str) =>
    BuatTagihanModel.fromJson(json.decode(str));

class BuatTagihanModel {
  BuatTagihanModel({
    required this.data,
    required this.error,
    required this.total,
  });

  final List<Datumm>? data;
  final bool error;
  final int total;

  factory BuatTagihanModel.fromJson(Map<String, dynamic> json) =>
      BuatTagihanModel(
        data: json["data"] == null
            ? null
            : List<Datumm>.from(json["data"].map((x) => Datumm.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
        total: json["total"] == null ? null : json["total"],
      );
}

class Datumm {
  Datumm({
    required this.labelJenis,
    required this.namaTagihan,
    required this.nominal,
    required this.bayar,
    required this.idBiaya,
    required this.idCredit,
    required this.semester,
    required this.type,
  });

  final String labelJenis;
  final String namaTagihan;
  final int nominal;
  final int bayar;
  final int idBiaya;
  final int idCredit;
  final int semester;
  final int type;

  factory Datumm.fromJson(Map<String, dynamic> json) => Datumm(
        labelJenis: json["label_jenis"] == null ? null : json["label_jenis"],
        namaTagihan: json["nama_tagihan"] == null ? null : json["nama_tagihan"],
        nominal: json["nominal"] == null ? null : json["nominal"],
        bayar: json["bayar"] == null ? null : json["bayar"],
        idBiaya: json["id_biaya"] == null ? null : json["id_biaya"],
        idCredit: json["id_credit"] == null ? null : json["id_credit"],
        semester: json["semester"] == null ? null : json["semester"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "label_jenis": labelJenis == null ? null : labelJenis,
        "nama_tagihan": namaTagihan == null ? null : namaTagihan,
        "nominal": nominal == null ? null : nominal,
        "bayar": bayar == null ? null : bayar,
        "id_biaya": idBiaya == null ? null : idBiaya,
        "id_credit": idCredit == null ? null : idCredit,
        "semester": semester == null ? null : semester,
        "type": type == null ? null : type,
      };
}

// To parse this JSON data, do
//
//     final saveTagihanModel = saveTagihanModelFromJson(jsonString);

SaveTagihanModel saveTagihanModelFromJson(String str) =>
    SaveTagihanModel.fromJson(json.decode(str));

String saveTagihanModelToJson(SaveTagihanModel data) =>
    json.encode(data.toJson());

class SaveTagihanModel {
  SaveTagihanModel({
    required this.error,
    required this.codeTrans,
    required this.pesan,
  });

  final bool error;
  final String codeTrans;
  final String pesan;

  factory SaveTagihanModel.fromJson(Map<String, dynamic> json) =>
      SaveTagihanModel(
        error: json["error"],
        codeTrans: json["code_trans"],
        pesan: json["pesan"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "code_trans": codeTrans,
        "pesan": pesan,
      };
}

CodeVaModel codeVaModelFromJson(String str) =>
    CodeVaModel.fromJson(json.decode(str));

class CodeVaModel {
  CodeVaModel(
      {required this.error,
      required this.virtualAccount,
      required this.dateExpired,
      required this.nominal,
      required this.bankName,
      required this.image});

  final bool error;
  final String virtualAccount;
  final DateTime? dateExpired;
  final String nominal;
  final String bankName;
  final String image;

  factory CodeVaModel.fromJson(Map<String, dynamic> json) => CodeVaModel(
        error: json["error"] == null ? null : json["error"],
        virtualAccount:
            json["virtual_account"] == null ? null : json["virtual_account"],
        dateExpired: json["date_expired"] == null
            ? null
            : DateTime.parse(json["date_expired"]),
        nominal: json["nominal"] == null ? null : json["nominal"],
        bankName: json["bank_name"] == null ? "" : json["bank_name"],
        image: json["image"] == null ? "" : json["image"],
      );
}
