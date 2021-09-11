# # 恭喜发现宝藏 ㊗️

欢迎来到我的站点，整个项目基于 flutter_web 搭建，同时支持 iOS、android 两端使用，点击这里就能访问哦：[hornhuang.github.io](https://hornhuang.github.io/#/?pg=index&)

![](https://github.com/hornhuang/PictureRepository/blob/master/hornhuang_github_io/hornhuang_github_io_bac.png)

</br>
  
# # 设置

运行钱需要对你的编译器进行一些设置

## # flutter

确定你的 flutter 已经安装，且 flutter 的版本与本项目一致，操作方法为如下所示

- 在终端/cmd 输入：

```css
flutter --version
```

- 判断是否跟如下一致

```css
Flutter 2.2.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision f4abaa0735 (2 个月前) • 2021-07-01 12:46:11 -0700
Engine • revision 241c87ad80
Tools • Dart 2.13.4
```

## # no-sound-null-safety

项目为了同时兼容 flutter_web 和 iOS/android 等多平台，所以做了很多兼容性操作，这里编译是需要开启 no-sound-null-safety

如果是 Android studio ，需要如下操作：

`Run --> Edit Configurations --> Add Additional Run args --> --no-sound-null-safety`

给个图片方便大家理解：

![](https://img-blog.csdnimg.cn/a6ec135e51ae41a5bd9979d0c5ba2376.png)

如果是 `VSCode` 或者命令行运行 ：

```css
flutter run --no-sound-null-safety
```

具体可以参考：[Cannot run with sound null safety because dependencies don't support null safety](https://stackoverflow.com/questions/64917744/cannot-run-with-sound-null-safety-because-dependencies-dont-support-null-safety)

> 如果配之后还是不可以，请发起一个 issue ，在其中附上自己电脑的 flutter doctor -v 内容、以及 flutter --version 、开发环境详细信息、问题截图和问题的详细描述
> 然后可以到我的 b 站 [bilibili@黎明韭菜]() 想我反馈下，也可以在 b 站直接搜索「黎明韭菜」～

# # 支持
  
项目采用了许多优秀的开原仓库，大佬们在百忙之中依然维持着怎么好的开源项目，让我们的开发过程更加丝滑，这里表示崇高的敬意与感谢
  
```css
  provider: ^5.0.0
  # 轮播图
  flutter_swiper_null_safety: ^1.0.2
  # webview_flutter:
  webview_flutter: ^2.0.12
  flutter_macos_webview: ^0.0.5
  webview_windows: ^0.0.7
  # tab controller web
  easy_tab_controller: ^1.0.1
  # GetX is an extra-light and powerful solution for Flutter.
  get: ^4.1.3
  # 动画
  animations: ^2.0.0
  # dart:html 不支持 Android 所以要换成这个
  universal_html: ^1.2.1
```

</br>

# # 导航

欢迎来到我的个人站点，在这里你可以得到所有你想要的知识

<table>
  <tr>
    <td><img src="https://github.com/hornhuang/PictureRepository/blob/master/hornhuang_github_io/hornhuang_github_io_bac_0.gif"></td>
    <td><img src="https://github.com/hornhuang/PictureRepository/blob/master/hornhuang_github_io/hornhuang_github_io_bac_1.gif"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/hornhuang/PictureRepository/blob/master/hornhuang_github_io/hornhuang_github_io_bac_2.gif"></td>
    <td><img src="https://github.com/hornhuang/PictureRepository/blob/master/hornhuang_github_io/hornhuang_github_io_bac_3.gif"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/hornhuang/PictureRepository/blob/master/hornhuang_github_io/hornhuang_github_io_bac_4.gif"></td>
    <td><img src="https://github.com/hornhuang/PictureRepository/blob/master/hornhuang_github_io/hornhuang_github_io_bac_5.gif"></td
  </tr>
</table>

</br>
  
# # MIT License

```html
Copyright (c) 2021 hornhuang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
