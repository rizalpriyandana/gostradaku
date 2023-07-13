import 'dart:convert';

GetIpkModel getIpkModelFromJson(String str) =>
    GetIpkModel.fromJson(json.decode(str));

class GetIpkModel {
  GetIpkModel({
    required this.error,
    required this.data,
    required this.total,
  });

  final bool error;
  final List<Datum>? data;
  final int total;

  factory GetIpkModel.fromJson(Map<String, dynamic> json) => GetIpkModel(
        error: json["error"] == null ? null : json["error"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"] == null ? null : json["total"],
      );
}

class Datum {
  Datum({
    required this.ipk,
    required this.semester,
  });

  final String ipk;
  final String semester;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        ipk: json["ipk"] == null ? null : json["ipk"],
        semester: json["semester"] == null ? null : json["semester"],
      );

  Map<String, dynamic> toJson() => {
        "ipk": ipk == null ? null : ipk,
        "semester": semester == null ? null : semester,
      };
}
