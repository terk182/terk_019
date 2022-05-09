// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        required this.success,
        required this.username,
        required this.uid,
    });

    int success;
    String username;
    String uid;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"],
        username: json["username"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "username": username,
        "uid": uid,
    };
}
