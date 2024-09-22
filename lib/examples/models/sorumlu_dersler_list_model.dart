import 'dart:convert';

List<SorumluDerslerListModel> sorumluDerslerListModelFromJson(String str) => List<SorumluDerslerListModel>.from(json.decode(str).map((x) => SorumluDerslerListModel.fromJson(x)));

String sorumluDerslerListModelToJson(List<SorumluDerslerListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SorumluDerslerListModel {
  int? id;
  String? adi;
  String? renk;
  bool? kilit;
  int? idDerslik;
  DateTime? tarih;
  String? periyot;
  int? uzunluk;

  SorumluDerslerListModel({
    this.id,
    this.adi,
    this.renk,
    this.kilit,
    this.idDerslik,
    this.tarih,
    this.periyot,
    this.uzunluk,
  });

  factory SorumluDerslerListModel.fromJson(Map<String, dynamic> json) => SorumluDerslerListModel(
    id: json["id"] ?? 0,
    adi: json["adi"] ?? "",
    renk: json["renk"] ?? "",
    kilit: json["kilit"] ?? false,
    idDerslik: json["id_derslik"] ?? 0,
    tarih: json["tarih"] != null ? DateTime.parse(json["tarih"]) : DateTime.now(),
    periyot: json["periyot"] ?? "",
    uzunluk: json["uzunluk"] ?? 0, 
  );

  Map<String, dynamic> toJson() => {
    "id": id ?? 0,
    "adi": adi ?? "",
    "renk": renk ?? "",
    "kilit": kilit ?? false,
    "id_derslik": idDerslik ?? 0,
    "tarih": (tarih ?? DateTime.now()).toIso8601String(),
    "periyot": periyot ?? "",
    "uzunluk": uzunluk ?? 0,
  };
}
