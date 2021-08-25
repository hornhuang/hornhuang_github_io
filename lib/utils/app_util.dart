import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:ui';

class AppUtil {
  static String _assetsImageBaseURL = "assets/images/";
  static String _assetsHtmlBaseURL = "assets/files/html/";

  static String getImageAssets(String path) {
    return _assetsImageBaseURL + path;
  }

  static String getHtmlAssets(String path) {
    return _assetsHtmlBaseURL + path;
  }

  static double ApplicationFrameWith(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double ApplicationFrameHeight = window.physicalSize.height;

  static bool isNarrow(BuildContext context) {
    bool smallThen1100 = AppUtil.ApplicationFrameWith(context) < 1100;
    return smallThen1100;
  }
}