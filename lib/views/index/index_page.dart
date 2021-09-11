import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/views/index/index_head_widget.dart';

class IndexPage extends StatefulWidget {
  static String Route = "index";
  AppLink? link;

  IndexPage({Key? key, this.link}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: AppUtil.ApplicationFrameWith(context),
            height: AppUtil.ApplicationFrameHeight,
            child: IndexHeadWidget()  ,
          )
        ],
      ),
    )
  }

}
