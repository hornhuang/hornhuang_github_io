import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/views/index/view/news_card.dart';
import 'package:hornhuang_github_io/views/index/view/title_widget.dart';

class LeftPanel extends StatefulWidget {
  List<VideoItemModel> choices;
  List<VideoItemModel> recommendations;

  LeftPanel({this.choices = const <VideoItemModel>[], this.recommendations = const <VideoItemModel>[], Key? key}) : super(key: key);

  @override
  _LeftPanelState createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {

  Widget _buildTitle(String title) {
    return TitleWidget(title);
  }

  Widget _buildVideos() {
    return GridView.count(
      semanticChildCount: widget.recommendations.length,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      padding: EdgeInsets.symmetric(vertical: 0),
      children: widget.recommendations.map((item) => InkWell(
        child: NewsCard(
          item,
        ),
        onTap: (){
          AppUtil.launchURL(item.link);
        },
      )).toList(),
    );
  }

  Widget _buildTrends() {
    return Container(
      height: 176,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.choices.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return InkWell(
              child: NewsCard(widget.choices[index]),
              onTap: (){
                AppUtil.launchURL(widget.choices[index].link);
              },
            );
          }
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
        Expanded(
            child: _buildVideos()
        ),
        _buildTitle("最近动态"),
        _buildTrends(),
      ],
    );
  }
}
