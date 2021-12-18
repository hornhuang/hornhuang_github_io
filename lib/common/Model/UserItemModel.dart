import 'package:hornhuang_github_io/common/base/base_model.dart';

class UserItemModel extends BaseModel {
  final String name;
  final String avtar_url;

  UserItemModel({this.name = "游客", this.avtar_url = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.51yuansu.com%2Fpic2%2Fcover%2F00%2F37%2F98%2F581229d477e5d_610.jpg"});

  @override
  Map getParams() {
    // TODO: implement getParams
    return {
      "name" : name,
      "avtar_url" : avtar_url,
    };
  }
}