import 'dart:convert';

HucreModel hucreModelFromJson(String str) => HucreModel.fromJson(json.decode(str));

String hucreModelToJson(HucreModel data) => json.encode(data.toJson());

class HucreModel{
  HucreModel({
    this.tarih,
    this.idDerslik,
    this.idPeriyot,
  });

  DateTime? tarih;
  int? idDerslik;
  int? idPeriyot;

  factory HucreModel.fromJson(Map<String, dynamic> json) => HucreModel(
    tarih: json["tarih"] != null ? DateTime.parse(json["tarih"]) : DateTime.now(),
    idDerslik: json["id_derslik"] ?? 0,
    idPeriyot: json["id_periyot"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "tarih": (tarih ?? DateTime.now()).toIso8601String(),
    "id_derslik": idDerslik ?? 0,
    "id_periyot": idPeriyot ?? 0
  };
}