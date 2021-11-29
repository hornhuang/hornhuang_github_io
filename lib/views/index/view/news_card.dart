import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';

class NewsCard extends StatelessWidget {
  VideoItemModel model;
  double width;
  double height;

  NewsCard(this.model, {this.width = 212, this.height = 176});

  Text _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      maxLines: 1,
      style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Text _buildSubTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      maxLines: 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w600
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: width,
      height: height,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(model.image),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(model.name),
                SizedBox(height: 6),
                Row(
                  children: [
                    _buildSubTitle(model.tags.toString()),
                    Spacer(),
                    _buildSubTitle(model.createdAt),
                  ],
                ),
              ],
            )
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
