import 'dart:convert';

List<OgretmenListModel> ogretmenListModelFromJson(String str) => List<OgretmenListModel>.from(json.decode(str).map((x) => OgretmenListModel.fromJson(x)));

String ogretmenListModelToJson(List<OgretmenListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OgretmenListModel {
  int? id;
  int? idDers;
  bool? gozetmen;
  String? adi;

  OgretmenListModel({
    this.id,
    this.idDers,
    this.gozetmen,
    this.adi,
  });

  factory OgretmenListModel.fromJson(Map<String, dynamic> json) => OgretmenListModel(
    id: json["id"] ?? 0,
    idDers: json["id_ders"] ?? 0,
    gozetmen: json["gozetmen"] ?? false,
    adi: json["adi"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id ?? 0,
    "id_ders": idDers ?? 0,
    "gozetmen": gozetmen ?? false,
    "adi": adi ?? "",
  };
}
