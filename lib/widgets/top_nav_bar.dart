import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/views/about_me/about_me_page.dart';
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
      height: 50,
      color: Colors.black.withAlpha(56),
      padding: EdgeInsets.fromLTRB(16, 0, 32, 0),
      alignment: Alignment.center,
      child: Row(
        children: [
          Image.asset(
            AppUtil.getImageAssets("Index/favicon.png"),
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
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
