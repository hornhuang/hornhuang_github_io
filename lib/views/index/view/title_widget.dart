import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

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
          height: 20,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        SizedBox(width: 8,),
        Text(
          "${widget.title}",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        InkWell(
          child: Text(
            "更多 > ",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: (){
            html.window.open("https://space.bilibili.com/262075972", 'new tab');
          },
        ),
      ],
    );
  }
}
