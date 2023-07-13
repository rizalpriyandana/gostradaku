import 'dart:convert';

BankModel bankModelFromJson(String str) => BankModel.fromJson(json.decode(str));

class BankModel {
  BankModel({
    required this.data,
    required this.error,
  });

  final List<Datum>? data;
  final bool error;

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );
}

class Datum {
  Datum(
      {required this.name,
      required this.nameBank,
      required this.norek,
      required this.atasnama,
      required this.img});

  final String name;
  final String nameBank;
  final String norek;
  final String atasnama;
  final String img;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        nameBank: json["name_bank"],
        norek: json["norek"],
        atasnama: json["atasnama"],
        img: json["img"],
      );
}
