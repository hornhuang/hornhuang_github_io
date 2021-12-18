import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/Model/message_item_model.dart';
import 'package:hornhuang_github_io/views/index/view/message_edit_card.dart';

class RightPanel extends StatefulWidget {
  List<MessageItemModel> messages = [];

  RightPanel({required this.messages, Key? key}) : super(key: key);

  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {

  Widget _buildMessage(MessageItemModel msg) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Text(
            msg.msg,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontSize: 8
            ),
          ),
          Spacer(),
          Container(
            width: 76,
            child: Text(
              msg.createdAt,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 8
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBoard() {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.messages.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                  padding: EdgeInsets.all(4),
                  child: _buildMessage(widget.messages[index])
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
