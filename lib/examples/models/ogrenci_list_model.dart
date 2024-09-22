import 'dart:convert';

List<OgrenciListModel> ogrenciListModelFromJson(String str) => List<OgrenciListModel>.from(json.decode(str).map((x) => OgrenciListModel.fromJson(x)));

String ogrenciListModelToJson(List<OgrenciListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OgrenciListModel {
  int? id;
  int? idDers;
  String? okulNo;
  String? adi;

  OgrenciListModel({
    this.id,
    this.idDers,
    this.okulNo,
    this.adi,
  });

  factory OgrenciListModel.fromJson(Map<String, dynamic> json) => OgrenciListModel(
    id: json["id"],
    idDers: json["id_ders"],
    okulNo: json["okul_no"],
    adi: json["adi"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_ders": idDers,
    "okul_no": okulNo,
    "adi": adi,
  };
}
