import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/widgets/bottom_nav_bar.dart';
import 'package:hornhuang_github_io/widgets/enlarge_widget.dart';
import 'package:hornhuang_github_io/widgets/top_nav_bar.dart';
import 'package:hornhuang_github_io/widgets/user_info_card.dart';

class HeadWidget extends StatefulWidget {
  @override
  _HeadWidgetState createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {

  Widget _buildBackground() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Color(0xFFfafafa),
                  ]),
            ),
          ),
        ),
        Image.asset(
          AppUtil.getImageAssets("Index/background.jpeg"),
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Row(
      children: [
        Spacer(),
        Container(
          height: 120,
          child: QuickLinkCard(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(36)),
          ),
        ),
        Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPhone = AppUtil.ApplicationFrameWidth(context) < 1000;
    return Scaffold(
      appBar: isPhone
          ? AppBar(
        backgroundColor: Theme.of(context).accentColor,
        leading: Text(''),
        elevation: 10,
        title: Text('Welcome!'),
        actions: <Widget>[TopNavigationBar.normalPopMenu(context)],
      )
          : null,
      body: Stack(
        children: [
          _buildBackground(),
          // SwiperWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isPhone ? Container() : TopNavigationBar(),
                Spacer(),
                EnlargeWidget(UserInfoCard(), height: 64),
                Spacer(),
                EnlargeWidget(_buildBottomNavBar(), height: 64),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
