import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/views/about_me/about_me_page.dart';
import 'package:hornhuang_github_io/views/index_page.dart';

import 'path.dart';

class RouteConfiguration {
  static List<Path> paths = [
    // Path(
    //   r'^/article/([\w-]+)$',
    //       (context, match) => Article.getArticlePage(match),
    // ),
    Path(
      IndexPage.Route,
          (context, match) => IndexPage(null, 'Flutter Demo Home Page'),
    ),
    Path(
      AboutMePage.Route,
          (context, match) => AboutMePage(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      if (settings.name == null) {
        continue;
      }
      final regExpPattern = RegExp(r'^' + settings.name!);
      if (regExpPattern.hasMatch(path.pattern)) {
        final firstMatch = regExpPattern.firstMatch(path.pattern);
        if (firstMatch == null) {
          continue;
        }
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) {
          return path.builder(context, match);
        },
          settings: settings,
        );
      }
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }
}