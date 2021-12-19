import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/Model/UserItemModel.dart';
import 'package:hornhuang_github_io/common/Model/message_item_model.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';
import 'package:hornhuang_github_io/common/base/base_model.dart';
import 'package:hornhuang_github_io/utils/logger.dart';
import 'package:hornhuang_github_io/utils/toast.dart';

typedef onBmobSucceed<T> = void Function(List<T> video);
typedef onBmobFailed = void Function(String errMsg);

//创建dio实例
Dio _dio = new Dio();

class BmobApi {

  post({required String event, Map<String, Object>? params}) {

  }

  get({required String event, Map<String, Object>? params}) {

  }

  ///保存一条数据
  static saveMessage(BuildContext context, String msg) async {

  }

  ///等于条件查询
  void queryMessage<T extends BaseModel>(onBmobSucceed<T> onSucceed, onBmobFailed onFailed) async {
    try {
      Response resp = await _dio.get("https://api.github.com/repos/hornhuang/hornhuang.github.io/issues");
      if (resp.statusCode == 200) {
        List<dynamic> data = resp.data;
        List<T> messages = data.map((i) => MessageItemModel(
            msg: i["title"],
            createdAt: i["created_at"],
            author: UserItemModel(name: i["user"]["login"], avatar_url: i["user"]["avatar_url"]),
            body: i["body"])
        ).toList() as List<T>;
        onSucceed(messages);
      }
    } catch (error) {
      ToastUtil.showFailed("发生未知错误，请在 GitHub 联系开发者修复");
      LogE("queryVideos", error.toString());
    }
  }

  ///保存一条数据
  static saveVideoSingle(BuildContext context,String content ) {
    // VideoItemModel blog = VideoItemModel(
    //    name: "博客标题1", link: content, blurb: "博客内容3", tags: ["tag"]
    // );
    // blog.save().then((BmobSaved bmobSaved) {
    //   String message =
    //       "发布成功，刷新查看";
    //   // currentObjectId = bmobSaved.objectId;
    //   ToastUtil.showSuccess(message);
    // }).catchError((e) {
    //   ToastUtil.showFailed("发生未知错误，请在 GitHub 联系开发者修复");
    //   LogE("saveVideoSingle", BmobError.convert(e).error);
    // });
  }

  ///等于条件查询
  Future<void> queryCourses<T extends BaseModel>(onBmobSucceed<T> onSucceed, onBmobFailed onFailed) async {
    try {
      Response resp = await _dio.get("https://raw.githubusercontent.com/hornhuang/hornhuang_github_io/main/data/course_data_provider");
      if (resp.statusCode == 200) {
        List<dynamic> data = jsonDecode(resp.data.toString());
        List<T> courses = data.map((i) => VideoItemModel.fromJson(i)).toList() as List<T>;
        onSucceed(courses);
      }
    } catch (error) {
      ToastUtil.showFailed("发生未知错误，请在 GitHub 联系开发者修复");
      LogE("queryVideos", error.toString());
    }
  }

  ///等于条件查询
  void queryDynamics<T extends BaseModel>(onBmobSucceed<T> onSucceed, onBmobFailed onFailed) async {
    try {
      Response resp = await _dio.get("https://raw.githubusercontent.com/hornhuang/hornhuang_github_io/main/data/dynamic_data_provider");
      if (resp.statusCode == 200) {
        List<dynamic>  data = jsonDecode(resp.data);
        List<T> dynamics = data.map(( i) => VideoItemModel.fromJson(i)).toList() as List<T>;
        onSucceed(dynamics);
      }
    } catch (error) {
      ToastUtil.showFailed("发生未知错误，请在 GitHub 联系开发者修复");
      LogE("queryVideos", error.toString());
    }
  }

  ///保存一条数据
  static reportErrorLog(String module, String content) {
    // ErrorReportModel blog = ErrorReportModel(
    //     module: module, msg: content,
    // );
    // blog.save().then((BmobSaved bmobSaved) {
    //   LogI("reportErrorLog", "上报异常 :: $content ; 在模块 :: $module");
    // }).catchError((e) {
    //   ToastUtil.showFailed("服务器发生异常，请 GitHub 反馈");
    // });
  }

}