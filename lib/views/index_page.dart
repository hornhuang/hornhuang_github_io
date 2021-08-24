import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/widgets/bottom_nav_bar.dart';
import 'package:hornhuang_github_io/widgets/enlarge_widget.dart';
import 'package:hornhuang_github_io/widgets/top_nav_bar.dart';
import 'package:hornhuang_github_io/widgets/user_info_card.dart';

import '../widgets/swiper_widget.dart';

class IndexPage extends StatefulWidget {
  static String Route = "/";
  AppLink? link;

  IndexPage({Key? key, this.link}) : super(key: key);

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
                EnlargeWidget(UserInfoCard(), height: 1000),
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
