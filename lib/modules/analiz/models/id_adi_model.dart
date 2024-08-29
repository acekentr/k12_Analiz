import 'dart:convert';

List<IdAdi> idAdiFromJson(String str) => List<IdAdi>.from(json.decode(str).map((x) => IdAdi.fromJson(x)));

String idAdiToJson(List<IdAdi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IdAdi {
  IdAdi({
    this.id,
    this.adi,
  });

  int? id;
  String? adi;

  factory IdAdi.fromJson(Map<String, dynamic> json) => IdAdi(
    id: json["id"],
    adi: json["adi"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "adi": adi,
  };
}
