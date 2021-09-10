import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';

class UserInfoCard extends StatelessWidget {

  Widget _buildPcBody() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "Hi~ I'm Hornhuang",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 32),
              ),
              Container(
                width: 280,
                child: Text(
                  "I have always enjoyed working with computers, so it was an easy decision to major in Information and Computing Science at Hunan University of Science and Technology with a plan to enter IT field.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ClipOval(
            child: Image.asset(
              AppUtil.getImageAssets("Index/favicon.png"),
              width: 280,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneBody() {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            AppUtil.getImageAssets("Index/favicon.png"),
            width: 160,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "Hi~ I'm Hornhuang",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        Container(
          width: 400,
          child: Text(
            "I have always enjoyed working with computers, so it was an easy decision to major in Information and Computing Science at Hunan University of Science and Technology with a plan to enter IT field.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = AppUtil.ApplicationFrameWith(context) - 200;
    return Container(
      width: cardWidth > 880 ? 880 : cardWidth,
      padding: EdgeInsets.fromLTRB(60, 60, 60, 60),
      child: Center(
        child: AppUtil.isNarrow(context) ? _buildPhoneBody() : _buildPcBody(),
      ),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(26),
        borderRadius: BorderRadius.all(Radius.circular(36)),
      ),
    );
  }
}
