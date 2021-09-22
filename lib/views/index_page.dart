import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/widgets/index/left_panel.dart';
import 'package:hornhuang_github_io/widgets/index/right_panel.dart';

class IndexPage extends StatefulWidget {
  static final String Route = "index";
  AppLink? link;

  IndexPage({Key? key, this.link}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: LeftPanel()
          ),
          Expanded(
              child: Container(
                width: 512,
                child: RightPanel(),
              )
          ),
        ],
      ),
    );
  }
}
