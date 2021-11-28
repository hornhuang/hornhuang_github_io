import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/app_link.dart';
import 'package:hornhuang_github_io/utils/statement_utils.dart';
import 'package:hornhuang_github_io/views/about_me_page.dart';
import 'package:hornhuang_github_io/views/welfare_page.dart';
import 'package:hornhuang_github_io/views/error_page.dart';
import 'package:hornhuang_github_io/views/index/index_page.dart';
import 'package:hornhuang_github_io/views/trend_page.dart';

import '../../widgets/swiper_widget.dart';

class RoutePage extends StatefulWidget {
  static String Route = AppLink(
    pageId: IndexPage.Route,
    bookId: null,
    user: null,
  ).toLocation();

  final String? match;

  RoutePage(Key? key, this.match) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {

  Widget _configPage(AppLink link) {
    Widget page = case2(link.pageId, {
      IndexPage.Route: IndexPage(link: link),
      AboutMePage.Route: AboutMePage(link: link),
      WelfarePage.Route: WelfarePage(link: link),
      TrendPage.Route: TrendPage(link: link),
    }, ErrorPage("找不到页面::${link.toLocation()}", null));
    return page;
  }

  @override
  Widget build(BuildContext context) {
    var link = AppLink.fromLocation(widget.match);
    return _configPage(link);
  }

}
