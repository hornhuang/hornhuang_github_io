import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hornhuang_github_io/common/bmob/bmob_api.dart';

enum ViewState {
  Idle,
  Busy
}

class BaseViewModel extends ChangeNotifier {

  BmobApi api;
  bool disposed = false;

  BaseViewModel({required this.api});

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }


  void dispose() {
    super.dispose();
    disposed = true;
  }


  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}