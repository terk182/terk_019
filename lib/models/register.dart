// To parse this JSON data, do
//
//     final registermodel = registermodelFromJson(jsonString);

import 'dart:convert';

Registermodel registermodelFromJson(String str) =>
    Registermodel.fromJson(json.decode(str));

String registermodelToJson(Registermodel data) => json.encode(data.toJson());

class Registermodel {
  Registermodel({
    required this.success,
    required this.message,
  });

  int success;
  String message;

  factory Registermodel.fromJson(Map<String, dynamic> json) => Registermodel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
