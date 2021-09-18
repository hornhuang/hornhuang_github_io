import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';

class LeftPanel extends StatefulWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  _LeftPanelState createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {

  List<VideoItemModel> _choices         = <VideoItemModel>[];
  List<VideoItemModel> _recommendations = <VideoItemModel>[];

  Widget _buildTitle(String title) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 16,
          color: Colors.orange,
        ),
        Text(
          "$title",
          style: TextStyle(

          ),
        ),
        Spacer(),
        Text(
          "更多",
          style: TextStyle(

          ),
        )
      ],
    );
  }

  Widget _buildChoices() {
    return ListView.builder(
      itemCount: _choices.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return new Text(_choices[index].name);
      }
    );
  }

  Widget _buildRecommendations() {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.symmetric(vertical: 0),
      children: _recommendations.map((item) => Text(item.name)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle("韭菜精选"),
        _buildChoices(),
        _buildTitle("占有推荐"),
        _buildRecommendations(),
      ],
    );
  }
}
