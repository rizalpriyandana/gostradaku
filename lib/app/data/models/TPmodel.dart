// To parse this JSON data, do
//
//     final getTpModel = getTpModelFromJson(jsonString);

import 'dart:convert';

GetTpModel getTpModelFromJson(String str) =>
    GetTpModel.fromJson(json.decode(str));

String getTpModelToJson(GetTpModel data) => json.encode(data.toJson());

class GetTpModel {
  GetTpModel({
    required this.periode,
    required this.codeTrans,
    required this.error,
  });

  final Periode periode;
  final CodeTrans codeTrans;
  final bool error;

  factory GetTpModel.fromJson(Map<String, dynamic> json) => GetTpModel(
        periode: Periode.fromJson(json["periode"]),
        codeTrans: CodeTrans.fromJson(json["code_trans"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "periode": periode.toJson(),
        "code_trans": codeTrans.toJson(),
        "error": error,
      };
}

class CodeTrans {
  CodeTrans({
    required this.data,
    required this.total,
  });

  final List<CodeTransDatum> data;
  final int total;

  factory CodeTrans.fromJson(Map<String, dynamic> json) => CodeTrans(
        data: List<CodeTransDatum>.from(
            json["data"].map((x) => CodeTransDatum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class CodeTransDatum {
  CodeTransDatum({
    required this.codeTrans,
  });

  final String codeTrans;

  factory CodeTransDatum.fromJson(Map<String, dynamic> json) => CodeTransDatum(
        codeTrans: json["code_trans"],
      );

  Map<String, dynamic> toJson() => {
        "code_trans": codeTrans,
      };
}

class Periode {
  Periode({
    required this.data,
    required this.total,
  });

  final List<PeriodeDatum> data;
  final int total;

  factory Periode.fromJson(Map<String, dynamic> json) => Periode(
        data: List<PeriodeDatum>.from(
            json["data"].map((x) => PeriodeDatum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class PeriodeDatum {
  PeriodeDatum({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory PeriodeDatum.fromJson(Map<String, dynamic> json) => PeriodeDatum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

// To parse this JSON data, do
//
//     final lihatBuktiModel = lihatBuktiModelFromJson(jsonString);

LihatBuktiModel lihatBuktiModelFromJson(String str) =>
    LihatBuktiModel.fromJson(json.decode(str));

class LihatBuktiModel {
  LihatBuktiModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datumm>? data;
  final int total;

  factory LihatBuktiModel.fromJson(Map<String, dynamic> json) =>
      LihatBuktiModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datumm>.from(json["data"].map((x) => Datumm.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datumm {
  Datumm({
    required this.uploads,
  });

  final String uploads;

  factory Datumm.fromJson(Map<String, dynamic> json) => Datumm(
        uploads: json["uploads"] == null ? null : json["uploads"],
      );
}
