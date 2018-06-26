import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unit_converter/category_widget.dart';
import 'package:unit_converter/unit.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatefulWidget {
//  static const _categories =  <Category>[
//    Category("Length", Colors.teal, Icons.cake),
//    Category("Area", Colors.orange, Icons.ac_unit),
//    Category("Volume", Colors.pinkAccent, Icons.surround_sound),
//    Category("Mass", Colors.blueAccent, Icons.print),
//    Category("Time", Colors.yellow, Icons.access_time),
//  ];

  const CategoryRoute();


  @override
  _CategoryRouterState createState() => _CategoryRouterState();
}

class _CategoryRouterState extends State<CategoryRoute> {

  final categories = <CategoryWidget>[];
  static const _categoryNames = <String>[
    "Length",
    "Area",
    "Volume",
    "Mass",
    "Time",
    "Digital Storage",
    "Energy",
    "Currency"
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red
  ];


  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(CategoryWidget(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: Icons.cake,
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }
  }

  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: "$categoryName Unit $i",
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final listView = Container(
      color: Colors.green[200],
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        "Unit Converter",
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
