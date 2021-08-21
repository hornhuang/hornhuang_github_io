
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';

class UserInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      padding: EdgeInsets.fromLTRB(60, 60, 60, 60),
      child: Row(
        children: [
          Container(
            width: 400,
            child: Text(
              "Hi~ I'm Hornhuang\n\nI have always enjoyed working with computers, so it was an easy decision to major in Information and Computing Science at Hunan University of Science and Technology with a plan to enter IT field.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24
              ),
            ),
          ),
          Spacer(),
          ClipOval(
            child: Image.asset(
              AppUtil.getImageAssets("Index/favicon.png"),
              width: 280,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(26),
        borderRadius: BorderRadius.all(Radius.circular(36)),
      ),
    );
  }
}
