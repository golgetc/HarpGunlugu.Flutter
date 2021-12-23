// To parse this JSON data, do
//
//     final haberModel = haberModelFromJson(jsonString);

import 'dart:convert';

List<HaberModel> haberModelFromJson(String str) =>
    List<HaberModel>.from(json.decode(str).map((x) => HaberModel.fromJson(x)));

String haberModelToJson(List<HaberModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HaberModel {
  HaberModel({
    this.tarih,
    this.hicri,
    this.yil,
    this.resimyol,
    this.detay,
    this.ad,
    this.id,
  });

  String tarih;
  String hicri;
  String yil;
  String resimyol;
  String detay;
  String ad;
  String id;

  factory HaberModel.fromJson(Map<String, dynamic> json) => HaberModel(
        id: json["id"] == null ? null : json["id"],
        tarih: json["tarih"] == null ? null : json["tarih"],
        hicri: json["hicri"] == null ? null : json["hicri"],
        yil: json["yil"] == null ? null : json["yil"],
        resimyol: json["resimyol"] == null ? null : json["resimyol"],
        detay: json["detay"] == null ? null : json["detay"],
        ad: json["ad"] == null ? null : json["ad"],
      );

  Map<String, dynamic> toJson() => {
        "tarih": tarih == null ? null : tarih,
        "hicri": hicri == null ? null : hicri,
        "yil": yil == null ? null : yil,
        "resimyol": resimyol == null ? null : resimyol,
        "detay": detay == null ? null : detay,
        "ad": ad == null ? null : ad,
        "id": id == null ? null : id,
      };
}
