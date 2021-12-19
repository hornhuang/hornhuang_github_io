import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/utils/logger.dart';
import 'package:hornhuang_github_io/views/index/view/news_card.dart';
import 'package:hornhuang_github_io/views/index/view/title_widget.dart';

class LeftPanel extends StatefulWidget {
  List<VideoItemModel> courses;
  List<VideoItemModel> dynamics;

  LeftPanel({this.courses = const <VideoItemModel>[], this.dynamics = const <VideoItemModel>[], Key? key}) : super(key: key);

  @override
  _LeftPanelState createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {

  Widget _buildTitle(String title) {
    return Container(
      padding: EdgeInsets.only(left: 4, right: 16),
      child: TitleWidget(title),
    );
  }

  Widget _buildVideos(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        children: widget.dynamics.map((item) => InkWell(
          child: NewsCard(
            item,
          ),
          onTap: (){
            AppUtil.launchURL(item.link);
          },
        )).toList(),
      ),
    );
  }

  Widget _buildTrends() {
    return Container(
      width: double.infinity,
      child: Wrap(
        children: widget.courses.map((item) => InkWell(
          child: NewsCard(
            item,
          ),
          onTap: (){
            AppUtil.launchURL(item.link);
          },
        )).toList(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle("教程分享"),
        _buildVideos(context),
        _buildTitle("最近动态"),
        _buildTrends(),
      ],
    );
  }
}
