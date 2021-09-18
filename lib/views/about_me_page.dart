import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/widgets/about_me/about_me_body_widget.dart';
import 'package:hornhuang_github_io/widgets/about_me/about_me_head_widget.dart';

class AboutMePage extends StatefulWidget {
  static String Route = "about_me";
  AppLink? link;

  AboutMePage({Key? key, this.link}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: AppUtil.ApplicationFrameWidth(context),
            height: AppUtil.ApplicationFrameHeight(context),
            child: AboutMeHeadWidget()  ,
          ),
          Container(
            width: AppUtil.ApplicationFrameWidth(context),
            height: AppUtil.ApplicationFrameHeight(context),
            child: AboutMeBodyWidget()  ,
          ),
        ],
      ),
    );
  }

}
