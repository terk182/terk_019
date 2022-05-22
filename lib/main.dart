import 'package:flutter/material.dart';
import 'package:terk_019/pages/terk.dart';

import 'router.dart' as router;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.generateRoute,
    home: MyApptt(),
  ));
}
