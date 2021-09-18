import 'package:data_plugin/bmob/bmob.dart';

// http://doc.bmob.cn/data/flutter/index.html
class BmobManager {

  BmobManager() {
    Bmob.init("https://api2.bmob.cn", "appId", "apiKey");
  }

}