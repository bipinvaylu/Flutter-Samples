import 'package:flutter/material.dart';
import 'package:unit_converter/category_route.dart';

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Unit Converter",
      home: CategoryRoute(),
    );
  }
}
