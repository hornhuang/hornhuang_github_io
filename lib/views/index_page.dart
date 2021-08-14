import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/views/about_me/about_me_page.dart';
import 'package:hornhuang_github_io/widgets/bottom_nav_bar.dart';
import 'package:hornhuang_github_io/widgets/top_nav_bar.dart';

import '../widgets/swiper_widget.dart';

class IndexPage extends StatefulWidget {
  IndexPage(Key? key, this.title) : super(key: key);

  final String title;

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  Widget _buildBottomNavBar() {
    return Row(
      children: [
        Spacer(),
        Container (
          height: 120,
          child: QuickLinkCard(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(36),topRight: Radius.circular(36)),
          ),
        ),
        Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SwiperWidget(),
          TopNavigationBar(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Container(
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
                ),
                Spacer(),
                _buildBottomNavBar()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
