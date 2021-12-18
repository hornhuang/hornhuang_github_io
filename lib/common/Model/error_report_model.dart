import 'package:hornhuang_github_io/common/base/base_model.dart';

class ErrorReportModel extends BaseModel {
  String module;
  String msg;

  ErrorReportModel({this.module = "", this.msg = ""});

  @override
  Map<String, dynamic> getParams() {
    return {
      "module": module,
      "msg": msg,
    };
  }

  factory ErrorReportModel.fromJson(Map<String, dynamic> json) {
    ErrorReportModel vm = ErrorReportModel(
      module: json['module'] as String,
      msg: json['msg'] as String,
    );
    vm.objectId = json['objectId'] as String;
    vm.createdAt = json['createdAt'] as String;
    return vm;
  }

}