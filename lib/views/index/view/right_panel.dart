import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/views/index/view/function_entry_card.dart';

class RightPanel extends StatefulWidget {
  String title;
  String createAt;

  RightPanel({this.title = "这条留言走丢了", this.createAt = "", Key? key}) : super(key: key);

  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {

  Widget _buildMessage() {
    return Row(
      children: [
        Text(
          "这是 ${widget.title} 条用户留言",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 8
          ),
        ),
        Spacer(),
        Container(
          width: 50,
          child: Text(
            "2021-06-66",
            style: TextStyle(
                fontSize: 8
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBoard() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 100,
      itemBuilder: (BuildContext ctxt, int index) {
        return InkWell(
          child: Container(
            padding: EdgeInsets.all(4),
            child: _buildMessage()
          ),
          onTap: () {},
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      child: Column(
        children: [
          FunctionEntryCard(),
          Expanded(
            child: _buildMessageBoard(),
          ),
        ],
      ),
    );
  }
}
