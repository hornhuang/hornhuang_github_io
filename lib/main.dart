import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/views/about_me/about_me_page.dart';
import 'package:hornhuang_github_io/views/index_page.dart';
import 'package:provider/provider.dart';

void main() {
  // TODO: 数据获取
  // Provider
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '黎明韭菜',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        IndexPage.Route: (context) => IndexPage(null, 'Flutter Demo Home Page'),
        AboutMePage.Route: (context) => AboutMePage(),
      },
    );
  }
}
