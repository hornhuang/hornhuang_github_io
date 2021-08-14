import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/views/about_me_page.dart';
import 'dart:html' as html;

class TopNavigationBar extends StatelessWidget {

  Widget _buildTabText(String title, {GestureTapCallback callback}) {
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
          _buildTabText("黎明韭菜"),
          Spacer(),
          _buildTabText("应用"),
          SizedBox(width: 32, height: 0,),
          _buildTabText("美图", callback: _onKLinkItemTapped(context, "https://pixabay.com/")),
          SizedBox(width: 32, height: 0,),
          _buildTabText("新鲜事", callback: _onKLinkItemTapped(context, "https://maimai.cn/article/headline")),
          SizedBox(width: 32, height: 0,),
          _buildTabText("GitHub", callback: _onKLinkItemTapped(context, "https://github.com/hornhuang")),
          SizedBox(width: 32, height: 0,),
          _buildTabText("关于我", callback: _onCustomItemTapped(context, AboutMePage())),
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
