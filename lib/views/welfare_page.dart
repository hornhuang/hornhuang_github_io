import 'package:universal_html/html.dart' as html;
import 'package:hornhuang_github_io/utils/FakeUi.dart' if (dart.library.html) 'package:hornhuang_github_io/utils/RealUi.dart' as ui;

import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';

class WelfarePage extends StatefulWidget {
  static String Route = "about_me";
  AppLink? link;

  WelfarePage({Key? key, this.link}) : super(key: key);

  @override
  _WelfarePageState createState() => _WelfarePageState();
}

class _WelfarePageState extends State<WelfarePage> {

  late html.IFrameElement _element;

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        AppUtil.getImageAssets("Welfare/neitui_background.png"),
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void initState() {
    // 注册
    _element = html.IFrameElement()
      ..style.border = 'none'
      ..src = "https://hornhuang.github.io/assets/assets/files/html/neitui.html";
    // 屏蔽报错
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'webInWeb',
          (int viewId) => _element,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          HtmlElementView(viewType: 'webInWeb'),
        ],
      ),
    );
  }
}