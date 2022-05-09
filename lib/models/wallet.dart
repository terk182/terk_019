// To parse this JSON data, do
//
//     final wallet = walletFromJson(jsonString);

import 'dart:convert';

Wallet walletFromJson(String str) => Wallet.fromJson(json.decode(str));

String walletToJson(Wallet data) => json.encode(data.toJson());

class Wallet {
  Wallet({
    required this.success,
    required this.wallet,
  });

  int success;
  List<WalletElement> wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        success: json["success"],
        wallet: List<WalletElement>.from(
            json["wallet"].map((x) => WalletElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "wallet": List<dynamic>.from(wallet.map((x) => x.toJson())),
      };
}

class WalletElement {
  WalletElement({
    required this.shop,
    required this.shopname,
    required this.balance,
    required this.status,
  });

  String shop;
  String shopname;
  String balance;
  String status;

  factory WalletElement.fromJson(Map<String, dynamic> json) => WalletElement(
        shop: json["shop"],
        shopname: json["shopname"],
        balance: json["balance"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "shop": shop,
        "shopname": shopname,
        "balance": balance,
        "status": status,
      };
}
