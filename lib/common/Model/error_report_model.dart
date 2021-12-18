import 'package:hornhuang_github_io/common/base/base_model.dart';

class ErrorReportModel extends BaseModel {
  String module;
  String msg;
  String createdAt;

  ErrorReportModel({this.module = "", this.msg = "", this.createdAt = ""});

  @override
  Map<String, dynamic> getParams() {
    return {
      "module": module,
      "msg": msg,
      "createdAt"  : createdAt,
    };
  }

  factory ErrorReportModel.fromJson(Map<String, dynamic> json) {
    ErrorReportModel vm = ErrorReportModel(
      module: json['module'] as String,
      msg: json['msg'] as String,
      createdAt: json['createdAt'] as String,
    );
    return vm;
  }

}