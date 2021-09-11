import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexBodyWidget extends StatefulWidget {
  @override
  _IndexBodyWidgetState createState() => _IndexBodyWidgetState();
}

class _IndexBodyWidgetState extends State<IndexBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
        ),
        children:<Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast)
        ]
    );
  }
}
