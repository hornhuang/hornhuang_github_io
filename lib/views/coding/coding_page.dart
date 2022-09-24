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
    _CodingSubject("android", "Coding/android_logo.jpg", "https://github.com/trending/kotlin?since=monthly"),
    _CodingSubject("ios", "Coding/ios_logo.jpg", "https://github.com/trending/swift?since=monthly"),
    _CodingSubject("flutter", "Coding/flutter_logo.png", "https://github.com/trending/dart?since=monthly"),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _buildSubjectCard(_CodingSubject subject) {
    return InkWell(
      child: Card(
        elevation: 4,
        shadowColor: Colors.black12,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset(
              AppUtil.getImageAssets(subject.iconUrl),
              fit: BoxFit.fitHeight,
            ),
          ),
        )
      ),
      onTap: (){
        html.window.open(subject.linkUrl, 'new tab');
      },
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
            mainAxisSpacing: 48,
            crossAxisSpacing: 48,
            childAspectRatio: 0.7,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(120),
            children: subjectList.map((item) => _buildEnlargeWidget(context, _buildSubjectCard(item))).toList(),
          ),
        );
  }
}
