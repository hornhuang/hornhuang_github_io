import 'dart:async';

import 'package:hornhuang_github_io/common/Model/message_item_model.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';
import 'package:hornhuang_github_io/common/base/base_view_model.dart';
import 'package:hornhuang_github_io/common/bmob/bmob_api.dart';
import 'package:hornhuang_github_io/utils/toast.dart';

class IndexViewModel extends BaseViewModel {
  Timer? _timer;
  int _countdownTime = 0;

  List<VideoItemModel> course = [];
  List<VideoItemModel> dynamics = [];

  List<MessageItemModel> messages = [];

  IndexViewModel({required BmobApi api}) : super(api: api);

  Future<void> fetchCourses() async {
    api.queryCourses<VideoItemModel>((videos){
      videos.forEach((element) {
        course = videos;
      });
      this.notifyListeners();
    }, (errMsg){
      ToastUtil.showFailed(errMsg);
    });
  }

  Future<void> fetchDynamics() async {
    api.queryDynamics<VideoItemModel>((videos){
      videos.forEach((element) {
        dynamics = videos;
      });
      this.notifyListeners();
    }, (errMsg){
      ToastUtil.showFailed(errMsg);
    });
  }

  Future<void> fetchMessages() async {
    api.queryMessage<MessageItemModel>((messages){
      this.messages = messages;
      this.notifyListeners();
    }, (errMsg){
      ToastUtil.showFailed(errMsg);
    });
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