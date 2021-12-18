import 'package:hornhuang_github_io/common/Model/video_item_model.dart';

class DynamicProvider{
  static List<VideoItemModel> attachCourse() {
    return [
      VideoItemModel(
        name: "宇航员在太空如何睡觉？",
        link: "https://www.bilibili.com/video/BV19q4y1u7A3/",
        tags: ["#每天冷知识","#睡觉"],
        image: "http://image.uc.cn/s/wemedia/s/upload/2021/44048e5e2f88a7621c19e0609dfb66ab.jpg",
        createdAt: "2021-11-28",
        type: "dynamic",
      ),
    ];
  }
}