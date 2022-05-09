import 'package:flutter/material.dart';
import 'package:terk_019/pages/add_booking_page.dart';
import 'package:terk_019/pages/home_page.dart';
import 'package:terk_019/pages/login_page.dart';
import 'package:terk_019/pages/qr_generate.dart';
import 'package:terk_019/pages/qr_promotion.dart';
import 'package:terk_019/pages/register_page.dart';
import 'package:terk_019/pages/root_app.dart';
import 'package:terk_019/pages/shop_page.dart';
import 'package:terk_019/pages/topup_page.dart';
import 'package:terk_019/pages/wallet_page.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  // ignore: unused_local_variable, unnecessary_new
  final Map<String, dynamic> args = <String, dynamic>{};

  switch (setting.name) {
    case '/root_app':
      return MaterialPageRoute(builder: (context) => const RootApp());
    case '/home_page':
      return MaterialPageRoute(builder: (context) => const HomePage());
    case '/shop_page':
      return MaterialPageRoute(builder: (context) => const ShopPage());
    case '/register_page':
      return MaterialPageRoute(builder: (context) => const RegisterPage());
    case '/login_page':
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case '/qr_generate':
      return MaterialPageRoute(builder: (context) => const GeneratePage());
    case '/qr_promotion':
      return MaterialPageRoute(builder: (context) => const QrPromotionPage());
    case '/topup_page':
      return MaterialPageRoute(builder: (context) => const TopupPage());
    case '/wallet_page':
      return MaterialPageRoute(builder: (context) => const walletpage());
    case '/add_booking_page':
      return MaterialPageRoute(builder: (context) => const Addbookingpage());

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(),
              ));
  }
}
