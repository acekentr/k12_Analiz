import 'dart:convert';

SinavBilgiModel sinavBilgiModelFromJson(String str) => SinavBilgiModel.fromJson(json.decode(str));

String sinavBilgiModelToJson(SinavBilgiModel data) => json.encode(data.toJson());

class SinavBilgiModel {
  DateTime? tarih;
  int? gun;
  int? periyot;

  SinavBilgiModel({
    this.tarih,
    this.gun,
    this.periyot,
  });

  factory SinavBilgiModel.fromJson(Map<String, dynamic> json) => SinavBilgiModel(
    tarih: json["tarih"] != null ? DateTime.parse(json["tarih"]) : DateTime.now(),
    gun: json["gun"] ?? 0,
    periyot: json["periyot"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "tarih": (tarih ?? DateTime.now()).toIso8601String(),
    "gun": gun ?? 0,
    "periyot": periyot ?? 0,
  };
}
