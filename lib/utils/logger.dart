import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

_Dispatcher logHistory = _Dispatcher("");

void _log(String module, String value) {
  String v = value ?? "";
  logHistory.value = v + "\n" + logHistory.value;
  if (kReleaseMode == false) {
    print(v);
  }
}

void LogI(String module, String value) {
  _log(module, value);
}

void LogE(String module, String value) {
  /// 实时上报 Bmob

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
