import 'package:flutter/material.dart';

import 'common/route/route_configuration.dart';
import 'views/index_page.dart';

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '黎明韭菜',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: IndexPage.Route,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
