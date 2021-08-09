import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class QuickLinkCard extends StatelessWidget {

  Widget _buildQuickLinkItem(String title, String imageAsset, String linkUrl) {
    return Expanded(
      flex: 1,
      child: InkWell(
        child: Column(
          children: [
            Spacer(),
            Container(
              width: 88,
              height: 66,
              child: Image.asset(
                  imageAsset
              ),
            ),
            // SizedBox(height: 16,),
            // Text(
            //   title,
            //   style: TextStyle(
            //     fontWeight: FontWeight.w900,
            //     fontSize: 16,
            //   ),
            // ),
            Spacer(),
          ],
        ),
        onTap: (){
          html.window.open(linkUrl, 'new tab');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuickLinkItem("掘金", "QuickLink/juejin.png", "https://juejin.cn/"),
        _buildQuickLinkItem("简书", "QuickLink/jianshu.png", "https://www.jianshu.com/"),
        _buildQuickLinkItem("CSDN", "QuickLink/csdn.png", "https://www.csdn.net/"),
        _buildQuickLinkItem("玩Android", "QuickLink/wanandroid.png", "https://www.wanandroid.com/"),
      ],
    );
  }

}
