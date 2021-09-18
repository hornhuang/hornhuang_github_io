import 'package:data_plugin/bmob/table/bmob_object.dart';

class TagItemModel extends BmobObject {

  String name;
  BigInt count;
  String ext_1= "";

  TagItemModel(this.name, this.count);

  @override
  Map getParams() {
    return {
      "name"  : name,
      "count" : count,
      "ext_1" : ext_1
    };
  }

}