import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class SwiperWidget extends StatelessWidget {

  var images = [
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic.36krcnd.com%2F201908%2F08155441%2Fcvsub292zjfcisb3.jpeg%211200&refer=http%3A%2F%2Fpic.36krcnd.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631112879&t=93f2106634c74e463a6c150f571dbded",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.phoenixrobots.cn%2Fd%2Ffile%2Fnews%2Fparents%2F2019-11-11%2F39f9a62defc47279356674a58cc4ad94.jpg&refer=http%3A%2F%2Fwww.phoenixrobots.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631112908&t=3b8705dcea4ef0b7ae2f0c1da06dd914",
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180621%2F041250f9636f48efb4e1536a13ad29bf.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631113050&t=16fa97c4df7f615f47fad5a6cffe51ea",
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        indicatorLayout: PageIndicatorLayout.NONE,
        autoplay: true,
        autoplayDelay: 4000,
        itemCount: images.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
        fade: 1.0,
        viewportFraction: 1.0,

    );
  }

}
