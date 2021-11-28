import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/route_page.dart';
import 'package:hornhuang_github_io/utils/toast.dart';

import 'common/route/route_configuration.dart';

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ToastUtil.build(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '黎明韭菜',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(minWidth: double.infinity, height: double.infinity),
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      initialRoute: RoutePage.Route,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
