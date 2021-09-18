import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包
import 'package:hornhuang_github_io/common/manager/bmob_manager.dart';
// import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart'; // Dio 网络请求调试工具

import 'app.dart';
import 'views/error_page.dart';

void main() {
  ///屏幕刷新率和显示率不一致时的优化
  GestureBinding.instance?.resamplingEnabled = true;
  runZonedGuarded(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      ///此处仅为展示，正规的实现方式参考 _defaultErrorWidgetBuilder 通过自定义 RenderErrorBox 实现
      return ErrorPage(
          details.exception.toString() + "\n " + details.stack.toString(), details);
    };
    runWebApp();
  }, (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
  BmobManager.run();
}

void runWebApp() {
  if (kDebugMode) {
    PluginManager.instance                                 // 注册插件
      ..register(WidgetInfoInspector())
      ..register(WidgetDetailInspector())
      ..register(ColorSucker())
      ..register(AlignRuler())
      ..register(Performance())
      ..register(ShowCode())
      ..register(MemoryInfoPage())
      ..register(CpuInfoPage())
      ..register(DeviceInfoPanel())
      ..register(Console());
    // ..register(DioInspector(dio: dio));                  // 传入你的 Dio 实例
    runApp(injectUMEWidget(child: MyApp(), enable: true));
//    runApp(ConfigWrapper(
//      child: injectUMEWidget(child: MyApp(), enable: true),
//      config: EnvConfig.fromJson(config),
//    )); // 初始化
  } else {
    runApp(MyApp());
//    runApp(ConfigWrapper(
//      child: MyApp(),
//      config: EnvConfig.fromJson(config),
//    ));
  }
}