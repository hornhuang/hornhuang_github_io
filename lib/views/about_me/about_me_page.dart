import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/widgets/webview/FakeUi.dart' if (dart.library.html) 'package:hornhuang_github_io/widgets/webview/RealUi.dart' as ui;
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMePage extends StatefulWidget {
  static String Route = "about_me";
  AppLink? link;

  AboutMePage({Key? key, this.link}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ui.platformViewRegistry.registerViewFactory(
        'hello-world-html',
            (int viewId) => IFrameElement()
          ..style.border = 'none'
          ..src = '/assets/files/html/neitui.html');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: HtmlElementView(
          viewType: 'hello-world-html',
        ),
      ),
    );
  }
}