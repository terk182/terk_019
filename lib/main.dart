import 'package:flutter/material.dart';
import 'package:terk_019/pages/add_product_page.dart';

import 'router.dart' as router;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.generateRoute,
    home: AddProductPage(),
  ));
}
