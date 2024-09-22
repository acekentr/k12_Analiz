import 'dart:convert';

import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';

List<ZamanModel> zamanModelFromJson(String str) => List<ZamanModel>.from(json.decode(str).map((x) => ZamanModel.fromJson(x)));

String zamanModelToJson(List<ZamanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ZamanModel {
  ZamanModel({
    this.id,
    this.tarih,
    this.periyot
  });

  int? id;
  DateTime? tarih;
  List<IdAdi>? periyot;

  factory ZamanModel.fromJson(Map<String, dynamic> json) => ZamanModel(
    id: json["id"],
    tarih: json["tarih"] != null ? DateTime.parse(json["tarih"]) : DateTime.now(),
    periyot: json["periyot"] != null ? List<IdAdi>.from(json["periyot"].map((x) => IdAdi.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tarih": (tarih ?? DateTime.now()).toIso8601String(),
    "periyot": periyot != null ? List<dynamic>.from(periyot!.map((x) => x.toJson())) : [],
  };
}

