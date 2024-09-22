import 'dart:convert';

List<OgrenciBlokZamanListModel> ogrenciBlokZamanListModelFromJson(String str) => List<OgrenciBlokZamanListModel>.from(json.decode(str).map((x) => OgrenciBlokZamanListModel.fromJson(x)));

String ogrenciBlokZamanListModelToJson(List<OgrenciBlokZamanListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OgrenciBlokZamanListModel {
  int? idOgrenci;
  DateTime? tarih;
  int? periyot;

  OgrenciBlokZamanListModel({
    this.idOgrenci,
    this.tarih,
    this.periyot,
  });

  factory OgrenciBlokZamanListModel.fromJson(Map<String, dynamic> json) => OgrenciBlokZamanListModel(
    idOgrenci: json["id_ogrenci"] ?? 0,
    tarih: json["tarih"] != null ? DateTime.parse(json["tarih"]) : DateTime.now(),
    periyot: json["periyot"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id_ogrenci": idOgrenci ?? 0,
    "tarih": (tarih ?? DateTime.now()).toIso8601String(),
    "periyot": periyot ?? 0,
  };
}
