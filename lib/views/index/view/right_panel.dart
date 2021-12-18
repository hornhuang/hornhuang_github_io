import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/views/index/view/message_edit_card.dart';

class RightPanel extends StatefulWidget {
  String title;
  String createAt;

  RightPanel({this.title = "这条留言走丢了", this.createAt = "2021-12-18", Key? key}) : super(key: key);

  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {

  Widget _buildMessage() {
    return Row(
      children: [
        Text(
          widget.title,
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
            widget.createAt,
            style: TextStyle(
                fontSize: 8
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBoard() {
    return Container(
      child: ListView.builder(
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
      ),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      child: Column(
        children: [
          MessageEditCard(),
          Expanded(
            child: _buildMessageBoard(),
          ),
        ],
      ),
    );
  }
}
