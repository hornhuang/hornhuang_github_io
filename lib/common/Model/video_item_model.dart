import 'package:hornhuang_github_io/common/base/base_model.dart';

enum VideoType {
  Course,
  Dynamic
}

class VideoItemModel extends BaseModel {

  String name;
  String link;
  String image;
  String blurb;
  String type;
  // BmobUser sharer;
  List<String> tags;

  VideoItemModel({this.name = "", this.link = "", this.image = "", this.blurb = "", this.type = "course", this.tags = const []});

  @override
  Map<String, dynamic> getParams() {
    return {
      "name"  : name,
      "link"  : link,
      "blurb" : blurb,
      "tags"  : tags,
      "type"  : type,
    };
  }

  factory VideoItemModel.fromJson(Map<String, dynamic> json) {
    VideoItemModel vm = VideoItemModel(
      name: json['name'] as String,
      link: json['link'] as String,
      blurb: json['blurb'] as String,
      image: json['image'] as String,
      type: json['type'] as String,
      tags: json['tags'].cast<String>(),
    );
    vm.objectId = json['objectId'] as String;
    vm.createdAt = json['createdAt'] as String;
    return vm;
  }

}