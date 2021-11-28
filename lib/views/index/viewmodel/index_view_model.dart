import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hornhuang_github_io/common/base/base_view_model.dart';
import 'package:hornhuang_github_io/common/bmob/bmob_api.dart';

class IndexViewModel extends BaseViewModel {

  Timer? _timer;
  int _countdownTime = 0;

  IndexViewModel({required BmobApi api}) : super(api: api);

  Future<void> sendSms(String mobile) async {
    await api.post(event: "sendSms", params: {"mobile":mobile});
  }

  Future<bool> login(String mobile, String sms) async {
    return await api.post(event: "login", params: {"mobile":mobile, "sms":sms}) != null;
  }

  void startCountdown() {
    _countdownTime = 60;
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        countdownTime--;
        if (countdownTime == 0) {
          cancelTimer();
        }
      });
    }
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }


  void dispose() {
    cancelTimer();
    super.dispose();
  }

  int get countdownTime => _countdownTime;

  set countdownTime(int value) {
    _countdownTime = value;
    notifyListeners();
  }

}