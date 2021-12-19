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

  Widget _buildSubTitle(String title, int flex) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        textAlign: TextAlign.left,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w600
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: width,
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
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...model.tags.map((e) => Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.only(right: 4),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: 8
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blueGrey.withOpacity(0.05),
                      ),
                    )).toList(),
                    Spacer(),
                    _buildSubTitle(model.createdAt, 0),
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
