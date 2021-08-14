import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:hornhuang_github_io/utils/app_util.dart';

class QuickLinkCard extends StatelessWidget {

  Widget _buildQuickLinkItem(String title, String imageAsset, String linkUrl) {
    return InkWell(
      child: Row(
        children: [
          SizedBox(width: 64,),
          Container(
            width: 88,
            height: 66,
            child: Image.asset(
                imageAsset
            ),
          ),
          SizedBox(width: 64,),
        ],
      ),
      onTap: (){
        html.window.open(linkUrl, 'new tab');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuickLinkItem("掘金", AppUtil.getImageAssets("QuickLink/juejin.png"), "https://juejin.cn/"),
        _buildQuickLinkItem("简书", AppUtil.getImageAssets("QuickLink/jianshu.png"), "https://www.jianshu.com/"),
        _buildQuickLinkItem("CSDN", AppUtil.getImageAssets("QuickLink/csdn.png"), "https://www.csdn.net/"),
        _buildQuickLinkItem("玩Android", AppUtil.getImageAssets("QuickLink/wanandroid.png"), "https://www.wanandroid.com/"),
      ],
    );
  }

}
