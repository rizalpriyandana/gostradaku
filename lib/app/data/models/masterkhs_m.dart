// To parse this JSON data, do
//
//     final masterKhsModel = masterKhsModelFromJson(jsonString);


import 'dart:convert';

MasterKhsModel masterKhsModelFromJson(String str) =>
    MasterKhsModel.fromJson(json.decode(str));

class MasterKhsModel {
  MasterKhsModel({
    required this.activeSemester,
    required this.activeBobot,
    required this.activePeriode,
    required this.ipActive,
    required this.data,
    required this.error,
  });

  final String activeSemester;
  final String activeBobot;
  final String activePeriode;
  final String ipActive;
  final List<Datum>? data;
  final bool error;

  factory MasterKhsModel.fromJson(Map<String, dynamic> json) => MasterKhsModel(
        activeSemester:
            json["active_semester"] == null ? null : json["active_semester"],
        activeBobot: json["active_bobot"] == null ? null : json["active_bobot"],
        activePeriode:
            json["active_periode"] == null ? null : json["active_periode"],
        ipActive: json["ip_active"] == null ? null : json["ip_active"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"] == null ? null : json["error"],
      );
}

class Datum {
  Datum({
    required this.id,
    required this.periode,
    required this.typePeriode,
    required this.tahun,
    required this.semester,
    required this.totalBobot,
    required this.mutu,
    required this.ip,
  });

  final String id;
  final String periode;
  final String typePeriode;
  final String tahun;
  final String semester;
  final String totalBobot;
  final String mutu;
  final String ip;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        periode: json["periode"] == null ? null : json["periode"],
        typePeriode: json["type_periode"] == null ? null : json["type_periode"],
        tahun: json["tahun"] == null ? null : json["tahun"],
        semester: json["semester"] == null ? null : json["semester"],
        totalBobot: json["total_bobot"] == null ? null : json["total_bobot"],
        mutu: json["mutu"] == null ? null : json["mutu"],
        ip: json["ip"] == null ? null : json["ip"],
      );
}
