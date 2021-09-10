import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

import 'package:hornhuang_github_io/utils/app_util.dart';

import 'enlarge_widget.dart';

class QuickLinkCard extends StatefulWidget {
  const QuickLinkCard({Key? key}) : super(key: key);

  @override
  _QuickLinkCardState createState() => _QuickLinkCardState();
}

class _QuickLinkCardState extends State<QuickLinkCard> {

  double get itemWidth => isPhone ? 66 : 88;
  double get itemHeight => isPhone ? 48 : 64;
  double get itemInterval => isPhone ? 48 : 64;
  bool isPhone = false;

  Widget _buildQuickLinkItem(String title, String imageAsset, String linkUrl) {
    return InkWell(
      child: Row(
        children: [
          SizedBox(width: itemInterval,),
          Container(
            width: itemWidth,
            height: itemHeight,
            child: Image.asset(
                imageAsset
            ),
          ),
          SizedBox(width: itemInterval,),
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

  List<Widget> _pcBody(BuildContext context) {
    return [
      _buildEnlargeWidget(context, _buildQuickLinkItem("掘金", AppUtil.getImageAssets("QuickLink/juejin.png"), "https://juejin.cn/")),
      _buildEnlargeWidget(context, _buildQuickLinkItem("简书", AppUtil.getImageAssets("QuickLink/jianshu.png"), "https://www.jianshu.com/")),
      _buildEnlargeWidget(context, _buildQuickLinkItem("CSDN", AppUtil.getImageAssets("QuickLink/csdn.png"), "https://www.csdn.net/")),
      _buildEnlargeWidget(context, _buildQuickLinkItem("玩Android", AppUtil.getImageAssets("QuickLink/wanandroid.png"), "https://www.wanandroid.com/")),
    ];
  }

  List<Widget> _phoneBody(BuildContext context) {
    return [
      _buildEnlargeWidget(context, _buildQuickLinkItem("掘金", AppUtil.getImageAssets("QuickLink/juejin.png"), "https://juejin.cn/")),
      _buildEnlargeWidget(context, _buildQuickLinkItem("玩Android", AppUtil.getImageAssets("QuickLink/wanandroid.png"), "https://www.wanandroid.com/")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = AppUtil.ApplicationFrameWith(context) - 200;
    isPhone = width <= 684;
    if(isPhone != isPhone) setState(() {});
    return Row(
      children: isPhone ? _phoneBody(context) : _pcBody(context),
    );
  }

}
