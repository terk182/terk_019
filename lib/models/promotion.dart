// To parse this JSON data, do
//
//     final promotion = promotionFromJson(jsonString);

import 'dart:convert';

Promotion promotionFromJson(String str) => Promotion.fromJson(json.decode(str));

String promotionToJson(Promotion data) => json.encode(data.toJson());

class Promotion {
  Promotion({
    required this.success,
    required this.promotion,
  });

  int success;
  List<PromotionElement> promotion;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        success: json["success"],
        promotion: List<PromotionElement>.from(
            json["promotion"].map((x) => PromotionElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "promotion": List<dynamic>.from(promotion.map((x) => x.toJson())),
      };
}

class PromotionElement {
  PromotionElement({
    required this.name,
    required this.image,
    required this.store,
    required this.deliveryTime,
    required this.storeType,
  });

  String name;
  String image;
  String store;
  String deliveryTime;
  String storeType;

  factory PromotionElement.fromJson(Map<String, dynamic> json) =>
      PromotionElement(
        name: json["name"],
        image: json["image"],
        store: json["store"],
        deliveryTime: json["delivery_time"],
        storeType: json["store_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "store": store,
        "delivery_time": deliveryTime,
        "store_type": storeType,
      };
}
