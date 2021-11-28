import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';
import 'package:hornhuang_github_io/views/index/view/title_widget.dart';

class LeftPanel extends StatefulWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  _LeftPanelState createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {

  List<VideoItemModel> _choices         = <VideoItemModel>[];
  List<VideoItemModel> _recommendations = <VideoItemModel>[];

  Widget _buildTitle(String title) {
    return TitleWidget(title);
  }

  Widget _buildVideos() {
    return ListView.builder(
      itemCount: _choices.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return new Text(_choices[index].name);
      }
    );
  }

  Widget _buildTrends() {
    return GridView.count(
      semanticChildCount: _recommendations.length,
      crossAxisCount: 3,
      padding: EdgeInsets.symmetric(vertical: 0),
      children: _recommendations.map((item) => Text(item.name)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle("【视频】精选教程"),
        _buildVideos(),
        _buildTitle("最近动态"),
        _buildTrends(),
      ],
    );
  }
}
