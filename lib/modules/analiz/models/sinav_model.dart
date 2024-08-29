import 'dart:convert';

import 'package:k12_analiz/modules/analiz/models/id_adi_model.dart';

List<SinavModel> sinavModelFromJson(String str) => List<SinavModel>.from(json.decode(str).map((x) => SinavModel.fromJson(x)));

String sinavModelToJson(List<SinavModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SinavModel {
  SinavModel({
    this.id,
    this.adi,
    this.renk,
    this.hucre,
    this.ogretmen,
    this.ogrenci
  });

  int? id;
  String? adi;
  String? renk;
  List<Hucre>? hucre;
  List<Ogretmen>? ogretmen;
  List<IdAdi>? ogrenci;


  factory SinavModel.fromJson(Map<String, dynamic> json) => SinavModel(
    id: json["id"] ?? 0,
    adi: json["adi"] ?? "",
    renk: json["renk"] ?? "3F51B5",
    hucre: json["hucre"] != null ? List<Hucre>.from(json["hucre"].map((x) => Hucre.fromJson(x))) : [],
    ogretmen: json["ogretmen"] != null ? List<Ogretmen>.from(json["ogretmen"].map((x) => Ogretmen.fromJson(x))) : [],
    ogrenci: json["ogrenci"] != null ? List<IdAdi>.from(json["ogrenci"].map((x) => IdAdi.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id ?? 0,
    "adi": adi ?? "",
    "renk": renk ?? "",
    "hucre": hucre != null ? List<dynamic>.from(hucre!.map((x) => x.toJson())) : [],
    "ogretmen": ogretmen != null ? List<dynamic>.from(ogretmen!.map((x) => x.toJson())) : [],
    "ogrenci": ogrenci != null ? List<dynamic>.from(ogrenci!.map((x) => x.toJson())) : [],
  };
}

class Hucre{
  Hucre({
    this.zamanId,
    this.derslikId,
    this.periyotId
  });

  int? zamanId;
  int? derslikId;
  int? periyotId;

  factory Hucre.fromJson(Map<String, dynamic> json) => Hucre(
    zamanId: json["zamanId"] ?? 0,
    derslikId: json["derslikId"] ?? 0,
    periyotId: json["periyotId"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "zamanId": zamanId ?? 0,
    "derslikId": derslikId ?? 0,
    "periyotId": periyotId ?? 0
  };
}

class Ogretmen {
  Ogretmen({
    this.id,
    this.adi,
    this.gozetmen,
  });

  int? id;
  String? adi;
  bool? gozetmen;

  factory Ogretmen.fromJson(Map<String, dynamic> json) => Ogretmen(
    id: json["id"] ?? 0,
    adi: json["adi"] ?? "",
    gozetmen: json["gozetmen"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id ?? 0,
    "adi": adi ?? "",
    "gozetmen": gozetmen ?? false
  };
}