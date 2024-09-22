import 'dart:convert';

List<DerslikBlokZamanListModel> derslikBlokZamanListModelFromJson(String str) => List<DerslikBlokZamanListModel>.from(json.decode(str).map((x) => DerslikBlokZamanListModel.fromJson(x)));

String derslikBlokZamanListModelToJson(List<DerslikBlokZamanListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DerslikBlokZamanListModel {
  int? idDerslik;
  DateTime? tarih;
  int? periyot;

  DerslikBlokZamanListModel({
    this.idDerslik,
    this.tarih,
    this.periyot,
  });

  factory DerslikBlokZamanListModel.fromJson(Map<String, dynamic> json) => DerslikBlokZamanListModel(
    idDerslik: json["id_derslik"] ?? 0,
    tarih: json["tarih"] != null ? DateTime.parse(json["tarih"]) : DateTime.now(),
    periyot: json["periyot"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id_derslik": idDerslik,
    "tarih": (tarih ?? DateTime.now()).toIso8601String(),
    "periyot": periyot,
  };
}
