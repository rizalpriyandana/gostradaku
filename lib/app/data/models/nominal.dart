import 'dart:convert';

class nominalModel {
  static String urlApi = "https://sia.iik-strada.ac.id/mobile/Data/master_krs";
  static String code = 'code';
}
// To parse this JSON data, do
//
//     final getTpModel = getTpModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final nominalModel = nominalModelFromJson(jsonString);

NominalModel nominalModelFromJson(String str) =>
    NominalModel.fromJson(json.decode(str));

String nominalModelToJson(NominalModel data) => json.encode(data.toJson());

class NominalModel {
  NominalModel({
    required this.status,
    required this.labelTotal,
    required this.total,
  });

  final bool status;
  final String labelTotal;
  final int total;

  factory NominalModel.fromJson(Map<String, dynamic> json) => NominalModel(
        status: json["status"],
        labelTotal: json["label_total"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "label_total": labelTotal,
        "total": total,
      };
}
