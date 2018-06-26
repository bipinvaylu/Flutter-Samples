import 'package:flutter/material.dart';

// @required is defined here
import 'package:meta/meta.dart';
import 'package:unit_converter/unit.dart';
import 'package:unit_converter/converter_route.dart';

// We use an underscore to indicate that these variables are private.
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryWidget extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const CategoryWidget({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  void _navigateToConvert(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(
            name: name,
            color: color,
            units: units,
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          height: _rowHeight,
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: color,
            splashColor: color,
            onTap: () {
              _navigateToConvert(context);
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(iconLocation, size: 60.0),
                  ),
                  Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
