import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/views/about_me_page.dart';
import 'dart:html' as html;

class TopNavigationBar extends StatelessWidget {

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
      color: Colors.black.withAlpha(50),
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          _buildTabText("黎明韭菜", _onCustomItemTapped(context, AboutMePage())),
          Spacer(),
          _buildTabText("flutter", _onKLinkItemTapped(context, "https://github.com/trending/dart?since=monthly")),
          SizedBox(width: 32, height: 0,),
          _buildTabText("iOS",  _onKLinkItemTapped(context, "https://github.com/trending/swift?since=monthly")),
          SizedBox(width: 32, height: 0,),
          _buildTabText("android", _onKLinkItemTapped(context, "https://github.com/trending/kotlin?since=monthly")),
          SizedBox(width: 32, height: 0,),
          _buildTabText("新鲜事", _onKLinkItemTapped(context, "https://maimai.cn/article/headline")),
          SizedBox(width: 32, height: 0,),
          _buildTabText("GitHub", _onKLinkItemTapped(context, "https://github.com/hornhuang")),
          SizedBox(width: 32, height: 0,),
          _buildTabText("关于我", _onCustomItemTapped(context, AboutMePage())),
        ],
      ),
    );
  }

  GestureTapCallback _onCustomItemTapped(BuildContext context, Widget page) {
    return (){
      if (page == null) {
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
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
