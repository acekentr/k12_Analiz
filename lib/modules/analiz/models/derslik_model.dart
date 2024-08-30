import 'dart:convert';

List<DerslikModel> derslikModelFromJson(String str) => List<DerslikModel>.from(json.decode(str).map((x) => DerslikModel.fromJson(x)));

String derslikModelToJson(List<DerslikModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DerslikModel {
  DerslikModel({
    this.id,
    this.adi,
    this.kapasite
  });

  int? id;
  String? adi;
  int? kapasite;

  factory DerslikModel.fromJson(Map<String, dynamic> json) => DerslikModel(
    id: json["id"] ?? 0,
    adi: json["adi"] ?? "",
    kapasite: json["kapasite"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "id": id ?? 0,
    "adi": adi ?? "",
    "kapasite": kapasite ?? 0,
  };
}
