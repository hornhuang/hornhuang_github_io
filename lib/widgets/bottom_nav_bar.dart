import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:hornhuang_github_io/utils/app_util.dart';

import 'enlarge_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildEnlargeWidget(context, _buildQuickLinkItem("掘金", AppUtil.getImageAssets("QuickLink/juejin.png"), "https://juejin.cn/")),
        _buildEnlargeWidget(context, _buildQuickLinkItem("简书", AppUtil.getImageAssets("QuickLink/jianshu.png"), "https://www.jianshu.com/")),
        _buildEnlargeWidget(context, _buildQuickLinkItem("CSDN", AppUtil.getImageAssets("QuickLink/csdn.png"), "https://www.csdn.net/")),
        _buildEnlargeWidget(context, _buildQuickLinkItem("玩Android", AppUtil.getImageAssets("QuickLink/wanandroid.png"), "https://www.wanandroid.com/")),
      ],
    );
  }

}
