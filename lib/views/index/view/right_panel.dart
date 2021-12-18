import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/Model/UserItemModel.dart';
import 'package:hornhuang_github_io/common/Model/message_item_model.dart';
import 'package:hornhuang_github_io/utils/toast.dart';
import 'package:hornhuang_github_io/widgets/enlarge_widget.dart';
import 'package:universal_html/html.dart' as html;

class RightPanel extends StatefulWidget {
  List<MessageItemModel> messages = [];

  RightPanel({required this.messages, Key? key}) : super(key: key);

  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  Widget _buildEnlargeWidget(Widget child) {
    GlobalKey anchorKey = GlobalKey();
    return EnlargeWidget(child, key: anchorKey, height: 12, scaleOnHover: true);
  }

  Widget _buildFeedbackCard() {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "给我留言",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "想看什么? 点这里来 GitHub 给我留言～",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), topLeft: Radius.circular(8)),
        ),
      ),
      onTap: () {
        html.window.open(
            "https://github.com/hornhuang/hornhuang.github.io/issues/new",
            'new tab');
      },
    );
  }

  Widget _buildMessage(MessageItemModel msg) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          children: [
            Text(
              msg.msg,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 4,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  child: ClipOval(
                    child: Image.network(msg.author?.avtar_url ?? UserItemModel().avtar_url),
                  ),
                ),
                SizedBox(width: 4,),
                Container(
                  width: 76,
                  child: Text(
                    msg.author?.name ?? UserItemModel().name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 76,
                  child: Text(
                    msg.createdAt,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        ToastUtil.showSuccess(msg.body);
      },
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
                  child: _buildEnlargeWidget(
                      _buildMessage(widget.messages[index]))),
              onTap: () {},
            );
          }),
      decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.4),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      child: Column(
        children: [
          _buildEnlargeWidget(_buildFeedbackCard()),
          // MessageEditCard(),
          Expanded(
            child: _buildMessageBoard(),
          ),
        ],
      ),
    );
  }
}
