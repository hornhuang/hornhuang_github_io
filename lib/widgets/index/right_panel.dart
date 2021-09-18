import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hornhuang_github_io/widgets/index/login_dialog.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({Key? key}) : super(key: key);

  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {

  Widget _buildLoginBtn() {
    return TextButton(
      child: Text('登录|注册'),
      onPressed: (){
        showDialog(
          context: context,
          builder: (ctx) {
            return LoginDialog();
          }
        );
      },
    );
  }

  Widget _buildShareBtn() {
    return TextButton(
      child: Text('+发布分享'),
      onPressed: (){
      },
    );
  }

  Widget _buildDonateBtn() {
    return TextButton(
      child: Text('买杯咖啡'),
      onPressed: (){
      },
    );
  }

  showLoginDialog() {
    showDialog(context: context, builder: (ctx) {
      return SimpleDialog(
        title: Text("SimpleDialog"),
        titlePadding: EdgeInsets.all(10),
        backgroundColor: Colors.amber,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        children: <Widget>[
          ListTile(
            title: Center(child: Text("Item_1"),),
          ),
          ListTile(
            title: Center(child: Text("Item_2"),),
          ),
          ListTile(
            title: Center(child: Text("登录"),),
            onTap: (){

            }
          ),
          ListTile(
            title: Center(child: Text("注册"),),
            onTap: (){

            }
          ),
          ListTile(
            title: Center(child: Text("取消"),),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLoginBtn(),
        _buildShareBtn(),
        _buildDonateBtn(),
      ],
    );
  }
}
