import 'dart:collection';

import 'package:data_plugin/bmob/table/bmob_object.dart';

class BaseModel extends BmobObject {

  BaseModel();

  BaseModel.fromJson(Map<String, dynamic> json);

  @override
  Map getParams() {
    return {};
  }

}