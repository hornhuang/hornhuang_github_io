import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_saved.dart';
import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/utils/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/common/Model/video_item_model.dart';
import 'package:hornhuang_github_io/common/base/base_model.dart';
import 'package:hornhuang_github_io/utils/toast.dart';

typedef onBmobSucceed<T> = void Function(List<T> video);
typedef onBmobFailed = void Function(String errMsg);

class BmobApi {

  post({required String event, Map<String, Object>? params}) {

  }

  get({required String event, Map<String, Object>? params}) {

  }

  ///保存一条数据
  static saveSingle(BuildContext context,String content ) {
    VideoItemModel blog = VideoItemModel(
       name: "博客标题1", link: content, blurb: "博客内容3", tags: ["tag"]
    );
    blog.save().then((BmobSaved bmobSaved) {
      String message =
          "创建一条数据成功：${bmobSaved.objectId} - ${bmobSaved.createdAt}";
      // currentObjectId = bmobSaved.objectId;
      ToastUtil.showSuccess(message);
    }).catchError((e) {
      ToastUtil.showSuccess(BmobError.convert(e).error);
    });
  }

  ///等于条件查询
  void queryWhereEqual<T extends BaseModel>(onBmobSucceed<T> onSucceed, onBmobFailed onFailed) {
    BmobQuery<T> query = BmobQuery();
    query.queryObjects().then((data) {
      List<T> blogs = data.map(( i) => VideoItemModel.fromJson(i)).toList() as List<T>;
      onSucceed(blogs);
    }).catchError((e) {
      onFailed(BmobError.convert(e).error);
    });
  }

}