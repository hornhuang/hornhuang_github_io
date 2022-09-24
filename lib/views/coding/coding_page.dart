import 'package:hornhuang_github_io/widgets/enlarge_widget.dart';
import 'package:universal_html/html.dart' as html;
import 'package:hornhuang_github_io/utils/FakeUi.dart' if (dart.library.html) 'package:hornhuang_github_io/utils/RealUi.dart' as ui;

import 'package:easy_tab_controller/easy_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/app_util.dart';

class _CodingSubject {
  String name;
  String iconUrl;
  String linkUrl;
  _CodingSubject(this.name, this.iconUrl, this.linkUrl);
}

class CodingPage extends StatefulWidget {
  static String Route = "coding";
  AppLink? link;

  CodingPage({Key? key, this.link}) : super(key: key);

  @override
  _CodingPageState createState() => _CodingPageState();
}

class _CodingPageState extends State<CodingPage> {


  final List<_CodingSubject> subjectList = [
    _CodingSubject("android", "https://pluspng.com/img-png/android-png-open-2000.png", "https://github.com/trending/kotlin?since=monthly"),
    _CodingSubject("ios", "https://ts1.cn.mm.bing.net/th/id/R-C.6a9729a418e16a0692abba37454604e1?rik=UTH83n0MVFH1CQ&riu=http%3a%2f%2fpluspng.com%2fimg-png%2flogo-apple-ios-png-iphone-ve-ios-512.png&ehk=DnnbGhQtkFypN2RSC0YRKlrelQvHRE9AkhRGeigZ9cg%3d&risl=&pid=ImgRaw&r=0", "https://github.com/trending/swift?since=monthly"),
    _CodingSubject("flutter", "https://tse3-mm.cn.bing.net/th/id/OIP-C.C1ovjT9NFzgFr_r5-E9shwHaHa?pid=ImgDet&rs=1", "https://github.com/trending/dart?since=monthly"),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _buildSubjectCard(_CodingSubject subject) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      child: Container(
        child: Image.network(subject.iconUrl),
      ),
    );
  }

  Widget _buildEnlargeWidget(BuildContext context, Widget child) {
    GlobalKey anchorKey = GlobalKey();
    return EnlargeWidget(child, key: anchorKey, height: 12, multiple: 1.05, scaleOnHover: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 0.7,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(60),
            children: subjectList.map((item) => _buildEnlargeWidget(context, _buildSubjectCard(item))).toList(),
          ),
        );
  }
}
