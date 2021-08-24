import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/views/index_page.dart';
import 'package:hornhuang_github_io/common/route/route_page.dart';

import 'path.dart';

class RouteConfiguration {
  static List<Path> paths = [
    // Path(
    //   r'^/article/([\w-]+)$',
    //       (context, match) => Article.getArticlePage(match),
    // ),
    Path(
      r'^' + IndexPage.Route,
          (context, match) => RoutePage(null, match),
    ),
  ];

  static MaterialPageRoute _buildpageRoute(Path path, RouteSettings settings) {
    return MaterialPageRoute<void>(
      builder: (context) {
        return path.builder(context, settings.name);
      },
      settings: settings,
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    print("dsadasd--onGenerateRoute ");
    for (Path path in paths) {
      if (settings.name == null) {
        continue;
      }
      return _buildpageRoute(path, settings);
    }
    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    return null;
  }
}