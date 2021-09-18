import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';

class VideoItemModel extends BmobObject {

  String name;
  String link;
  String blurb;
  BmobUser sharer;
  List<String> tags;

  VideoItemModel(this.name, this.link, this.blurb, this.sharer, this.tags);

  @override
  Map getParams() {
    return {
      "name"  : name,
      "link"  : link,
      "blurb" : blurb,
      "tags"  : tags,
    };
  }



}