import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/views/index/view/function_entry_card.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({Key? key}) : super(key: key);

  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {

  Widget _buildMessageBoard() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 100,
      itemBuilder: (BuildContext ctxt, int index) {
        return InkWell(
          child: Container(
            padding: EdgeInsets.all(4),
            child: Text(
              "这是 ${index} 条用户留言",
              style: TextStyle(
                  fontSize: 8
              ),
            ),
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
