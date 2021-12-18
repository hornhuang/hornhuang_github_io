import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/Model/error_report_model.dart';
import 'package:hornhuang_github_io/common/Model/message_item_model.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';
import 'package:hornhuang_github_io/common/base/base_model.dart';
import 'package:hornhuang_github_io/utils/logger.dart';
import 'package:hornhuang_github_io/utils/toast.dart';

typedef onBmobSucceed<T> = void Function(List<T> video);
typedef onBmobFailed = void Function(String errMsg);

class BmobApi {

  post({required String event, Map<String, Object>? params}) {

  }

  get({required String event, Map<String, Object>? params}) {

  }

  ///保存一条数据
  static saveMessage(BuildContext context, String msg) {
    MessageItemModel blog = MessageItemModel(
        msg: msg
    );
    blog.save().then((BmobSaved bmobSaved) {
      String message =
          "发布成功，刷新查看";
      ToastUtil.showSuccess(message);
    }).catchError((e) {
      /// BmobError.convert(e).error
      ToastUtil.showSuccess("发生未知错误，请在 GitHub 联系开发者修复");
    });
  }

  ///等于条件查询
  void queryMessage<T extends BaseModel>(onBmobSucceed<T> onSucceed, onBmobFailed onFailed) {
    BmobQuery<T> query = BmobQuery();
    query.queryObjects().then((data) {
      List<T> blogs = data.map((i) => MessageItemModel.fromJson(i)).toList() as List<T>;
      onSucceed(blogs);
    }).catchError((e) {
      onFailed(BmobError.convert(e).error);
    });
  }

  ///保存一条数据
  static saveVideoSingle(BuildContext context,String content ) {
    VideoItemModel blog = VideoItemModel(
       name: "博客标题1", link: content, blurb: "博客内容3", tags: ["tag"]
    );
    blog.save().then((BmobSaved bmobSaved) {
      String message =
          "发布成功，刷新查看";
      // currentObjectId = bmobSaved.objectId;
      ToastUtil.showSuccess(message);
    }).catchError((e) {
      ToastUtil.showSuccess(BmobError.convert(e).error);
    });
  }

  ///等于条件查询
  void queryVideos<T extends BaseModel>(onBmobSucceed<T> onSucceed, onBmobFailed onFailed) {
    BmobQuery<T> query = BmobQuery();
    query.queryObjects().then((data) {
      List<T> blogs = data.map(( i) => VideoItemModel.fromJson(i)).toList() as List<T>;
      onSucceed(blogs);
    }).catchError((e) {
      /// BmobError.convert(e).error
      ToastUtil.showSuccess("发生未知错误，请在 GitHub 联系开发者修复");
    });
  }

  ///保存一条数据
  static reportErrorLog(String module, String content) {
    ErrorReportModel blog = ErrorReportModel(
        module: module, msg: content,
    );
    blog.save().then((BmobSaved bmobSaved) {
      LogI("reportErrorLog", "上报异常 :: $content ; 在模块 :: $module");
    }).catchError((e) {
      ToastUtil.showSuccess(BmobError.convert(e).error);
    });
  }

}