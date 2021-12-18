import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/bmob/bmob_api.dart';

_Dispatcher logHistory = _Dispatcher("");
_Dispatcher errorHistory = _Dispatcher("");

void _log(String module, String value) {
  String message = module + " :: " + value;
  logHistory.value = message + "\n" + logHistory.value;
  if (kReleaseMode == false) {
    print(module);
  }
}

void LogI(String module, String value) {
  _log(module, value);
}

void LogE(String module, String value) {
  _log(module, value);
  /// 实时上报 Bmob
  if (errorHistory.value == module+value) {
    return;
  }
  errorHistory.value = module+value;
  BmobApi.reportErrorLog(module, value);
}

// Take from: https://flutter.dev/docs/testing/errors
void initLogger(VoidCallback runApp) {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      LogE("runZonedGuarded", details.stack.toString());
    };
    runApp.call();
  }, (Object error, StackTrace stack) {
    LogE("runZonedGuarded", stack.toString());
  });
}

class _Dispatcher extends ValueNotifier<String> {
  _Dispatcher(String value) : super(value);
}
