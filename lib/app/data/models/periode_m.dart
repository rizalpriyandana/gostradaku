// To parse this JSON data, do
//
//     final periodeModel = periodeModelFromJson(jsonString);

import 'dart:convert';

PeriodeModel periodeModelFromJson(String str) => PeriodeModel.fromJson(json.decode(str));

String periodeModelToJson(PeriodeModel data) => json.encode(data.toJson());

class PeriodeModel {
    PeriodeModel({
       required this.periode,
       required this.error,
    });

    Periode periode;
    bool error;

    factory PeriodeModel.fromJson(Map<String, dynamic> json) => PeriodeModel(
        periode: Periode.fromJson(json["periode"]),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "periode": periode.toJson(),
        "error": error,
    };
}

class Periode {
    Periode({
       required this.data,
    });

    List<Datum> data;

    factory Periode.fromJson(Map<String, dynamic> json) => Periode(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
       required this.id,
       required this.name,
    });

    String id;
    String name;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
