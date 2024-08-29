import 'dart:convert';

List<KilitliHucreModel> kilitliHucreModelFromJson(String str) => List<KilitliHucreModel>.from(json.decode(str).map((x) => KilitliHucreModel.fromJson(x)));

String kilitliHucreModelToJson(List<KilitliHucreModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KilitliHucreModel {
  KilitliHucreModel({
    this.zamanId,
    this.derslikId,
    this.periyotId
  });

  int? zamanId;
  int? derslikId;
  int? periyotId;

  factory KilitliHucreModel.fromJson(Map<String, dynamic> json) => KilitliHucreModel(
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
