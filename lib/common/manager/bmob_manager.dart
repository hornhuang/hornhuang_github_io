import 'package:data_plugin/bmob/bmob.dart';

// http://doc.bmob.cn/data/flutter/index.html
class BmobManager {
  String _appId = "f213b6762f9ce60a7258f0819a3cb47d";
  String _apiKey = "021586ae3514e5f70568e49bb8ed1ddb";
  // 静态变量指向自身
  static final BmobManager _instance = BmobManager._();
  // 私有构造器
  BmobManager._(){
    Bmob.init("https://api2.manager.cn", _appId, _apiKey);
  }
  // 方案3：静态属性获得实例变量
  static BmobManager get instance => _instance;

  static run() {
    BmobManager.instance;
  }
}