import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/utils/statement_utils.dart';
import 'package:hornhuang_github_io/views/coding/coding_page.dart';
import 'package:hornhuang_github_io/views/welfare_page.dart';
import 'package:hornhuang_github_io/views/trend_page.dart';
import 'package:universal_html/html.dart' as html;

import 'enlarge_widget.dart';

enum _popMenu {
  coding,
  gwy,
  things,
  github,
  about
}

class TopNavigationBar extends StatefulWidget implements PreferredSizeWidget {
  Size preferredSize;

  static Widget normalPopMenu(BuildContext context) {
    return new PopupMenuButton<_popMenu>(
        itemBuilder: (BuildContext context) => <PopupMenuItem<_popMenu>>[
          new PopupMenuItem<_popMenu>(
              value: _popMenu.coding, child: new Text('编程')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.gwy, child: new Text('考公')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.things, child: new Text('新鲜事')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.github, child: new Text('GitHub')),
          new PopupMenuItem<_popMenu>(
              value: _popMenu.about, child: new Text('福利'))
        ],
        onSelected: (_popMenu value) {
          String link = case2(value, {
            _popMenu.coding : CodingPage.Route,
            _popMenu.gwy : "https://github.com/hornhuang/coder2ShiYeBian",
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

  TopNavigationBar({this.preferredSize = const Size(double.infinity, 32)});

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
              color: Colors.white70,
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
        ),
        onTap: callback
    );
  }

  Widget _buildTitleNavBar(BuildContext context) {
    return Container(
      color: Color(0xFF002036),
      padding: EdgeInsets.fromLTRB(16, 0, 32, 0),
      height: kBottomNavigationBarHeight,
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
          _buildEnlargeWidget(context, _buildTabText("编程", _onCustomItemTapped(context, CodingPage.Route))),
          SizedBox(width: 32, height: 0,),
          _buildEnlargeWidget(context, _buildTabText("考公",  _onKLinkItemTapped(context, "https://github.com/hornhuang/coder2ShiYeBian"))),
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