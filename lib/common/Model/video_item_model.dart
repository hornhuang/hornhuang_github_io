import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:hornhuang_github_io/common/base/base_model.dart';

class VideoItemModel extends BaseModel {

  String name;
  String link;
  String image;
  String blurb;
  // BmobUser sharer;
  List<String> tags;

  VideoItemModel({this.name = "", this.link = "", this.image = "", this.blurb = "", this.tags = const []});

  @override
  Map<String, dynamic> getParams() {
    return {
      "name"  : name,
      "link"  : link,
      "blurb" : blurb,
      "tags"  : tags,
    };
  }

  factory VideoItemModel.fromJson(Map<String, dynamic> json) {
    VideoItemModel vm = VideoItemModel(
      name: json['name'] as String,
      link: json['link'] as String,
      blurb: json['blurb'] as String,
      image: json['image'] as String,
      // url: json['url'] as String,
      tags: json['tags'].cast<String>(),
    );
    vm.objectId = json['objectId'] as String;
    vm.createdAt = json['createdAt'] as String;
    return vm;
  }

}