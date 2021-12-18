import 'package:hornhuang_github_io/common/base/base_model.dart';

import 'UserItemModel.dart';

class MessageItemModel extends BaseModel {
  late UserItemModel? author = UserItemModel();
  String msg;
  String body;
  String createdAt;

  MessageItemModel({this.msg = "", this.createdAt = "", this.author, this.body = ""});

  @override
  Map<String, dynamic> getParams() {
    return {
      "msg": msg,
      "createdAt"  : createdAt,
      "author"  : author?.getParams(),
      "body"  : body,
    };
  }

  factory MessageItemModel.fromJson(Map<String, dynamic> json) {
    MessageItemModel vm = MessageItemModel(
      msg: json['msg'] as String,
      createdAt: json['createdAt'] as String,
      author: json['author'] as UserItemModel,
      body: json['body'] as String,
    );
    return vm;
  }

}