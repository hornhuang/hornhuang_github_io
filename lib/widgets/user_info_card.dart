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
                "圆号本昊@hornhuang",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: 280,
                child: Text(
                  "「介绍」一只客户端开发猿，活跃于掘金、简书等论坛\n「目标」一点一滴建设开源平台，完善中文互联网技术\n【技能】iOS & flutter & android\n【被动】帮小伙伴内推大厂，一个萝卜一个坑，走过路过不要错过\n【法术】求个三连，bilibili @ 黎明韭菜",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black87, fontSize: 16),
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
              fit: BoxFit.contain,
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
    double padding = AppUtil.isNarrow(context) ? 16 : 64;
    double cardWidth = AppUtil.ApplicationFrameWith(context) - 200;
    return Container(
      width: cardWidth > 880 ? 880 : cardWidth,
      padding: EdgeInsets.all(padding),
      child: Center(
        child: AppUtil.isNarrow(context) ? _buildPhoneBody() : _buildPcBody(),
      ),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(36)),
        boxShadow: [
          BoxShadow(
              color: Color(0xff63b5f7).withAlpha(24),
              offset: Offset(-4.0, 6.0), //陰影x軸偏移量
              blurRadius: 16, //陰影模糊程度
              spreadRadius: 8 //陰影擴散程度
          )
        ]
      ),
    );
  }
}
