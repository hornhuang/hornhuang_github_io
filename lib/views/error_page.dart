import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  FlutterErrorDetails? details;
  String errorMsg;

  ErrorPage(this.errorMsg, this.details);

  Widget _buildTitle() {
    return Center(
      child: Text(
        "404 页面走丢了",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget _buildErrMsgContent() {
    return Center(
      child: Text(
        errorMsg,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget _buildDetalsContent() {
    return Center(
      child: Text(
        details.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTitle(),
          _buildErrMsgContent(),
          _buildDetalsContent()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}
