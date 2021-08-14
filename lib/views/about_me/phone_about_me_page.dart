import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PhoneAboutMePage extends StatefulWidget {
  @override
  _PhoneAboutMePageState createState() => _PhoneAboutMePageState();
}

class _PhoneAboutMePageState extends State<PhoneAboutMePage> {
  WebViewController? _webViewController;
  String filePath = 'assets/files/agreement.html';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('享你来服务条款')),
        body: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            _loadHtmlFromAssets();
          },
        )
    );
  }

  _loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController?.loadUrl(Uri.dataFromString(fileHtmlContents,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}