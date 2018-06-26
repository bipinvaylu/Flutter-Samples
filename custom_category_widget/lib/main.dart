import 'package:flutter/material.dart';
import 'package:custom_category_widget/category.dart';

const _categoryName = "Cake";
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.greenAccent;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Category',
        home: Scaffold(
            backgroundColor: Colors.green[100],
            body: Center(
              child: Category(
                name: _categoryName,
                color: _categoryColor,
                iconLocation: _categoryIcon,
              ),
            )));
  }
}
