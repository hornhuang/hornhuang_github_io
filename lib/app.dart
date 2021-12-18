import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/route/route_page.dart';
import 'package:hornhuang_github_io/utils/toast.dart';

import 'common/route/route_configuration.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigatorKey,
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
