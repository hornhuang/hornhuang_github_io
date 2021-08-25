import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/widgets/tab/tab_item.dart';

enum WebTabLocation {
  top,
  bottom,
  left,
  right,
}

class WebTabController extends StatefulWidget {
  List<TabItem> tabs;
  List<Widget> body;

  WebTabLocation location;
  Color color;
  Image? background;
  AppBar? appBar;

  WebTabController({
    Key? key,
    this.tabs = const <TabItem>[],
    this.body = const <Widget>[],
    this.location = WebTabLocation.top,
    this.color = Colors.white,
    this.background,
    this.appBar}) : super(key: key);

  @override
  _WebTabControllerState createState() => _WebTabControllerState();
}

class _WebTabControllerState extends State<WebTabController> {
  int selectedIndex = 0;

  Widget _buildTabs() {
    widget.tabs[0].isSelected = true;
    widget.tabs
      .asMap()
      .forEach((index, element) {
        element.ontap = () {
          widget.tabs.forEach((element) {
            element.isSelected = false;
          });
          selectedIndex = index;
          element.isSelected = true;
          setState(() { });
        };
      });
    return Row(
      children: [
        ...widget.tabs
      ],
    );
  }

  Widget _buildContent() {
    Widget body = Container();
    if (selectedIndex > widget.body.length - 1 || widget.body.length == 0) {
      body = Center(
        child: Text(
          "null content"
        ),
      );
    } else {
      body = widget.body[selectedIndex];
    }
    return body;
  }

  List<Widget> _configBody() {
    return (widget.location == WebTabLocation.top
        || widget.location == WebTabLocation.left) ?
    [_buildTabs(), _buildContent()] : [ _buildContent(), _buildTabs()];
  }

  Widget _buildBody() {
    return (widget.location == WebTabLocation.top
        || widget.location == WebTabLocation.bottom) ?
        Column(
          children: [
            ..._configBody()
          ],
        ) :
        Row(
          children: [
            ..._configBody()
          ],
        );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.background ?? Container(),
        Scaffold(
          appBar: widget.appBar,
          body: _buildBody(),
        )
      ],
    );
  }
}
