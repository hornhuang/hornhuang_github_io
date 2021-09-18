import 'package:data_plugin/bmob/table/bmob_user.dart';

class UserManager {
  BmobUser? _user;

  // 静态变量指向自身
  static final UserManager _instance = UserManager._();
  // 私有构造器
  UserManager._(){

  }
  // 方案3：静态属性获得实例变量
  static UserManager get instance => _instance;

  static get isLogined => _instance._user != null;

  update(BmobUser user) {
    _user = user;
  }
}