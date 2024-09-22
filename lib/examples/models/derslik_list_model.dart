import 'dart:convert';

List<DerslikListModel> derslikListModelFromJson(String str) => List<DerslikListModel>.from(json.decode(str).map((x) => DerslikListModel.fromJson(x)));

String derslikListModelToJson(List<DerslikListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DerslikListModel {
  DerslikListModel({
    this.id,
    this.adi,
    this.kapasite
  });

  int? id;
  String? adi;
  int? kapasite;

  factory DerslikListModel.fromJson(Map<String, dynamic> json) => DerslikListModel(
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
