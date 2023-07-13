// To parse this JSON data, do
//
//     final masterKrs = masterKrsFromJson(jsonString);


import 'dart:convert';

MasterKrs masterKrsFromJson(String str) => MasterKrs.fromJson(json.decode(str));

class MasterKrs {
  MasterKrs({
    required this.activeSemester,
    required this.activeBobot,
    required this.activePeriode,
    required this.data,
    required this.error,
  });

  final String activeSemester;
  final String activeBobot;
  final String activePeriode;
  final List<Datum>? data;
  final bool error;

  factory MasterKrs.fromJson(Map<String, dynamic> json) => MasterKrs(
        activeSemester:
            json["active_semester"] == null ? null : json["active_semester"],
        activeBobot: json["active_bobot"] == null ? null : json["active_bobot"],
        activePeriode:
            json["active_periode"] == null ? null : json["active_periode"],
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
  });

  final String id;
  final String periode;
  final String typePeriode;
  final String tahun;
  final String semester;
  final String totalBobot;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        periode: json["periode"] == null ? null : json["periode"],
        typePeriode: json["type_periode"] == null ? null : json["type_periode"],
        tahun: json["tahun"] == null ? null : json["tahun"],
        semester: json["semester"] == null ? null : json["semester"],
        totalBobot: json["total_bobot"] == null ? null : json["total_bobot"],
      );
}
