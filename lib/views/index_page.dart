import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';
import 'package:hornhuang_github_io/widgets/quick_link_card.dart';

import '../widgets/swiper_widget.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  Widget _buildTabText(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16
      ),
    );
  }

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

  Widget _buildTitleNavBar() {
    return Container(
      color: Colors.black.withAlpha(50),
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              AppUtil.baseURL + "Index/favicon.png"
            ),
          ),
          Spacer(),
          _buildTabText("应用"),
          SizedBox(width: 32, height: 0,),
          _buildTabText("美图"),
          SizedBox(width: 32, height: 0,),
          _buildTabText("新鲜事"),
          SizedBox(width: 32, height: 0,),
          _buildTabText("GitHub"),
          SizedBox(width: 32, height: 0,),
          _buildTabText("关于我"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SwiperWidget(),
          _buildTitleNavBar(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Container(
                  margin: EdgeInsets.fromLTRB(120, 0, 120, 0),
                  padding: EdgeInsets.fromLTRB(60, 60, 60, 60),
                  child: Row(
                    children: [
                      Container(
                        width: 400,
                        child: Text(
                          "Hornhuang\n\nI have always enjoyed working with computers, so it was an easy decision to major in Information and Computing Science at Hunan University of Science and Technology with a plan to enter IT field.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24
                          ),
                        ),
                      ),
                      Spacer(),
                      ClipOval(
                        child: Image.network(
                          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic4.zhimg.com%2Fv2-b6eae3250bb62fadb3d2527f466cf033_b.jpg&refer=http%3A%2F%2Fpic4.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631113070&t=c25deadb136d92e4aae0aa11fc6a4d5c",
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
