import 'package:hornhuang_github_io/common/base/base_model.dart';

class MessageItemModel extends BaseModel {

  String msg;
  String createdAt;

  MessageItemModel({this.msg = "", this.createdAt = ""});

  @override
  Map<String, dynamic> getParams() {
    return {
      "msg": msg,
      "createdAt"  : createdAt,
    };
  }

  factory MessageItemModel.fromJson(Map<String, dynamic> json) {
    MessageItemModel vm = MessageItemModel(
      msg: json['msg'] as String,
      createdAt: json['createdAt'] as String,
    );
    return vm;
  }

}