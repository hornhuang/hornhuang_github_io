import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/bmob/bmob_api.dart';

class TitleWidget extends StatefulWidget {
  String title;

  TitleWidget(this.title);

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 16,
          color: Colors.orange,
        ),
        Text(
          "${widget.title}",
          style: TextStyle(

          ),
        ),
        Spacer(),
        Text(
          "更多",
          style: TextStyle(

          ),
        )
      ],
    );
  }
}
