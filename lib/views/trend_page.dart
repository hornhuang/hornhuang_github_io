import 'package:universal_html/html.dart' as html;
import 'dart:ui' as ui;

import 'package:easy_tab_controller/easy_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';

class TrendPage extends StatefulWidget {
  static String Route = "trend";
  AppLink? link;

  TrendPage({Key? key, this.link}) : super(key: key);

  @override
  _TrendPageState createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {

  final String androidType = "android";
  final String iosType = "ios";
  final String flutterType = "flutter";

  late html.IFrameElement _androidElement;

  void registerElement(String type, String initialUrl) {
    // 注册
    html.IFrameElement _element = html.IFrameElement()
      ..style.border = 'none'
      ..src = initialUrl;
    // 屏蔽报错
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      type,
      (int viewId) => _element,
    );
  }

  @override
  void initState() {
    registerElement(flutterType, "https://juejin.cn/tag/Flutter");
    registerElement(iosType, "https://juejin.cn/tag/iOS");
    registerElement(androidType, "https://juejin.cn/tag/Android");
    super.initState();
  }

  List<Widget> _elementList() {
    return [
      Expanded(
        flex: 1,
        child: HtmlElementView(viewType: androidType),
      ),
      Expanded(
        flex: 1,
        child: HtmlElementView(viewType: iosType),
      ),
      Expanded(
        flex: 1,
        child: HtmlElementView(viewType: flutterType),
      ),
    ];
  }

  Widget _buildPcView() {
    return Row(
      children: [
        ..._elementList()
      ],
    );
  }

  Widget _buildNarrowView() {
    return EasyTabController(
      location: WebTabLocation.left,
      tabs: [
        TabItemBuilder(
          icon: Icon(Icons.directions_car),
          title: "Android",
        ),
        TabItemBuilder(
          icon: Icon(Icons.directions_bike),
          title: "iOS",
        ),
        TabItemBuilder(
          icon: Icon(Icons.directions_boat),
          title: 'Flutter',
        ),
      ],
      body:[
          ..._elementList()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text("loading..."),
          ),
          if (AppUtil.isNarrow(context)) ... [
            _buildNarrowView()
          ] else ... [
            _buildPcView()
          ],
        ],
      )
    );
  }
}
