import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/utils/statement_utils.dart';
import 'package:hornhuang_github_io/views/about_me/welfare_me_page.dart';
import 'package:hornhuang_github_io/views/trend_page.dart';
import 'dart:html' as html;

import 'enlarge_widget.dart';

import 'package:flutter/cupertino.dart';

enum _popMenu {
  flutter,
  android,
  ios,
  things,
  github,
  about
}

class TopNavigationBar extends StatefulWidget {

  static Widget nomalPopMenu(BuildContext context) {
    return new PopupMenuButton<_popMenu>(
        itemBuilder: (BuildContext context) => <PopupMenuItem<_popMenu>>[
          new PopupMenuItem<_popMenu>(
              value: _popMenu.flutter, child: new Text('flutter')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.ios, child: new Text('ios')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.android, child: new Text('android')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.things, child: new Text('新鲜事')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.github, child: new Text('GitHub')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.about, child: new Text('福利'))
        ],
        onSelected: (_popMenu value) {
          String link = case2(value, {
            _popMenu.flutter : "https://github.com/trending/dart?since=monthly",
            _popMenu.ios : "https://github.com/trending/swift?since=monthly",
            _popMenu.android : "https://github.com/trending/kotlin?since=monthly",
            _popMenu.things : TrendPage.Route,
            _popMenu.github : "https://github.com/hornhuang",
            _popMenu.about : WelfarePage.Route,
          }, "");
          if (value == _popMenu.things || value == _popMenu.about)
            Navigator.of(context).pushNamed(AppLink(
              pageId: link,
              bookId: null,
              user: null,
            ).toLocation());
          else {
            html.window.open(link, 'new tab');
          }
        });
  }

  @override
  TopNavigationBarState createState() => TopNavigationBarState();
}

class TopNavigationBarState extends State<TopNavigationBar> {
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
          _buildEnlargeWidget(context, _buildTabText("新鲜事", _onCustomItemTapped(context, TrendPage.Route))),
          SizedBox(width: 32, height: 0,),
          _buildEnlargeWidget(context, _buildTabText("GitHub", _onKLinkItemTapped(context, "https://github.com/hornhuang"))),
          SizedBox(width: 32, height: 0,),
          _buildEnlargeWidget(context, _buildTabText("福利", _onCustomItemTapped(context, WelfarePage.Route)))
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
        pageId: route,
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