// To parse this JSON data, do
//
//     final promotionlist = promotionlistFromJson(jsonString);

import 'dart:convert';

Promotionlist promotionlistFromJson(String str) =>
    Promotionlist.fromJson(json.decode(str));

String promotionlistToJson(Promotionlist data) => json.encode(data.toJson());

class Promotionlist {
  Promotionlist({
    required this.success,
    required this.promotion,
  });

  int success;
  List<Promotion> promotion;

  factory Promotionlist.fromJson(Map<String, dynamic> json) => Promotionlist(
        success: json["success"],
        promotion: List<Promotion>.from(
            json["promotion"].map((x) => Promotion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "promotion": List<dynamic>.from(promotion.map((x) => x.toJson())),
      };
}

class Promotion {
  Promotion({
    required this.promotionName,
    required this.promotionUid,
    required this.ownerUid,
    required this.productUid,
    required this.discount,
    required this.discounType,
    required this.startDate,
    required this.endDate,
    required this.imgPath,
    required this.productName,
  });

  String promotionName;
  String promotionUid;
  String ownerUid;
  String productUid;
  String discount;
  String discounType;
  DateTime startDate;
  DateTime endDate;
  String imgPath;
  String productName;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        promotionName: json["promotion_name"],
        promotionUid: json["promotion_uid"],
        ownerUid: json["owner_uid"],
        productUid: json["product_uid"],
        discount: json["discount"],
        discounType: json["discoun_type"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        imgPath: json["img_path"],
        productName: json["product_name"],
      );

  Map<String, dynamic> toJson() => {
        "promotion_name": promotionName,
        "promotion_uid": promotionUid,
        "owner_uid": ownerUid,
        "product_uid": productUid,
        "discount": ownerUid,
        "discoun_type": discounType,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "img_path": imgPath,
        "product_name": productName,
      };
}
