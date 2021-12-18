import 'package:hornhuang_github_io/common/base/base_model.dart';

class MessageItemModel extends BaseModel {

  String msg;

  MessageItemModel({this.msg = ""});

  @override
  Map<String, dynamic> getParams() {
    return {
      "msg": msg,
    };
  }

  factory MessageItemModel.fromJson(Map<String, dynamic> json) {
    MessageItemModel vm = MessageItemModel(
      msg: json['msg'] as String,
    );
    vm.objectId = json['objectId'] as String;
    vm.createdAt = json['createdAt'] as String;
    return vm;
  }

}