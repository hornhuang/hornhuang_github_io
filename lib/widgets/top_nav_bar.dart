import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/views/about_me/about_me_page.dart';
import 'dart:html' as html;

import 'enlarge_widget.dart';

import 'package:flutter/cupertino.dart';

class TopNavigationBar extends StatefulWidget {

  static Widget nomalPopMenu() {
    return new PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
          new PopupMenuItem<String>(
              value: 'value01', child: new Text('Item One')),
          new PopupMenuItem<String>(
              value: 'value02', child: new Text('Item Two')),
          new PopupMenuItem<String>(
              value: 'value03', child: new Text('Item Three')),
          new PopupMenuItem<String>(
              value: 'value04', child: new Text('I am Item Four'))
        ],
        onSelected: (String value) {
//          setState(() { _bodyStr = value; });
        });
  }

  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  GlobalKey anchorKey = GlobalKey();

  Widget _buildTabText(String title, GestureTapCallback? callback) {
    return InkWell(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16
          ),
        ),
        onTap: callback
    );
  }

  Widget _buildTitleNavBar(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(56),
      padding: EdgeInsets.fromLTRB(16, 16, 32, 16),
      alignment: Alignment.center,
      child: Flex (
        direction: Axis.horizontal,
        children: [
          Image.asset(
            AppUtil.getImageAssets("Index/favicon.png"),
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
          Spacer(),
          _buildEnlargeWidget(context, _buildTabText("flutter", _onKLinkItemTapped(context, "https://github.com/trending/dart?since=monthly"))),
          SizedBox(width: 32, height: 0,),
          _buildEnlargeWidget(context, _buildTabText("iOS",  _onKLinkItemTapped(context, "https://github.com/trending/swift?since=monthly"))),
          SizedBox(width: 32, height: 0,),
          _buildEnlargeWidget(context, _buildTabText("android", _onKLinkItemTapped(context, "https://github.com/trending/kotlin?since=monthly"))),
          SizedBox(width: 32, height: 0,),
          _buildEnlargeWidget(context, _buildTabText("新鲜事", _onKLinkItemTapped(context, "https://maimai.cn/article/headline"))),
          SizedBox(width: 32, height: 0,),
          _buildEnlargeWidget(context, _buildTabText("GitHub", _onKLinkItemTapped(context, "https://github.com/hornhuang"))),
          SizedBox(width: 32, height: 0,),
          _buildEnlargeWidget(context, _buildTabText("关于我", _onCustomItemTapped(context, AboutMePage.Route)))
        ],
      ),
    );
  }

  Widget _buildEnlargeWidget(BuildContext context, Widget child) {
    GlobalKey anchorKey = GlobalKey();
    return EnlargeWidget(child, key: anchorKey, height: 50,  scaleOnHover: true);
    //   MouseRegion(
    //   onEnter: (_) {
    //     RenderBox renderBox = anchorKey.currentContext!.findRenderObject() as RenderBox;
    //     var offset = renderBox.localToGlobal(Offset(0.0, renderBox.size.height));
    //     _showMenu(context, offset);
    //   },
    //   onExit: (_) {
    //
    //   },
    //   child: EnlargeWidget(child, height: 50, key: anchorKey, scaleOnHover: true),
    // );
  }

  GestureTapCallback _onCustomItemTapped(BuildContext context, String route) {
    return (){
      if (route.length == 0) {
        return;
      }
      Navigator.of(context).pushNamed(AppLink(
        pageId: AboutMePage.Route,
        bookId: null,
        user: null,
      ).toLocation());
    };
  }

  GestureTapCallback _onKLinkItemTapped(BuildContext context, String link) {
    return (){
      if (link == null || link.length <= 0) {
        return;
      }
      html.window.open(link, 'new tab');
    };
  }

  @override
  Widget build(BuildContext context) {
    return _buildTitleNavBar(context);
  }
}