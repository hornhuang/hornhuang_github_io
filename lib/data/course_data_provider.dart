import 'package:hornhuang_github_io/common/Model/video_item_model.dart';

class CourseProvider{
  static List<VideoItemModel> attachCourse() {
    return [
      VideoItemModel(
        name: "为什么卫生纸要丢进马桶而不是垃圾桶？",
        link: "https://www.bilibili.com/video/BV1xP4y157wX/",
        tags: ["#每天冷知识","#卫生纸"],
        image: "http://image.uc.cn/s/wemedia/s/upload/2021/828645d654a8ae2c170c18e822ad772f.jpg",
        createdAt: "2021-11-28",
        type: "course",
      ),
      VideoItemModel(
        name: "酵母菌放多了会对身体有害吗？",
        link: "https://www.bilibili.com/video/BV1g341187Rx/",
        tags: ["#每天冷知识","#包子"],
        image: "http://image.uc.cn/s/wemedia/s/upload/2021/8fa4de90ddf4ab414950697732ecc662.jpg",
        createdAt: "2021-11-28",
        type: "course",
      ),
    ];
  }
}