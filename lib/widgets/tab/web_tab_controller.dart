import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/widgets/tab/tab_item.dart';

import 'tab_item_builder.dart';

enum WebTabLocation {
  top,
  bottom,
  left,
  right,
}

class WebTabController extends StatefulWidget {
  List<TabItemBuilder> tabs;
  List<Widget> body;

  WebTabLocation location;
  Color color;
  Image? background;
  AppBar? appBar;

  WebTabController({
    Key? key,
    this.tabs = const <TabItemBuilder>[],
    this.body = const <Widget>[],
    this.location = WebTabLocation.top,
    this.color = Colors.white,
    this.background,
    this.appBar}) : super(key: key);

  @override
  _WebTabControllerState createState() => _WebTabControllerState();
}

class _WebTabControllerState extends State<WebTabController> {
  List<TabItem> tabItems = [];
  List<GlobalKey<TabItemState>> keys = [];
  TabItem? selectedItem;
  GlobalKey<TabItemState>? selectedKey;
  int selectedIndex = 0;

  _configItemTabs() {
    if (widget.tabs.length < 1) {
      return;
    }
    widget.tabs
        .asMap()
        .forEach((index, element) {
          GlobalKey<TabItemState> key = GlobalKey();
          keys.add(key);
          TabItem tab = TabItem.builder(element, tabKey: key);
          tab.index = index;
          tab.ontap = () {
            element.ontap?.call();
            setState(() {
              selectedKey?.currentState?.onStateChanged(false);
              selectedIndex = index;
              tab.isSelected = true;
              selectedItem = tab;
              selectedKey = keys[index];
            });
          };
          tabItems.add(tab);
    });
    selectedKey = keys[0];
    selectedItem = tabItems[0];
    selectedItem?.isSelected = true;
  }

  Widget _buildTabs() {
    return Row(
      children: [
        ...tabItems
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
  void initState() {
    super.initState();
    _configItemTabs();
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
