import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {

  static FToast? _fToast;

  static build(BuildContext context) {
    if (_fToast == null) {
      _fToast = FToast();
      _fToast?.init(context);
    }
  }

  static showSuccess(String text) {
    _showToast(
        text,
    );
  }

  static showFailed(String text) {
    _showToast(
        text,
        backgroundColor: Colors.pinkAccent
    );
  }

  static _showToast(String message, {Color backgroundColor = Colors.grey}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );


    _fToast?.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    _fToast?.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: 16.0,
            left: 16.0,
          );
        });
  }
}