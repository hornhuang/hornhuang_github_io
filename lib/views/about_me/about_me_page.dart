import 'dart:html' as html;
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';

class AboutMePage extends StatefulWidget {
  static String Route = "about_me";
  AppLink? link;

  AboutMePage({Key? key, this.link}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {

  late html.IFrameElement _element;
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
          Center(child: Text("Loading..."),),
          HtmlElementView(viewType: 'webInWeb'),
        ],
      ),
    );
  }
}