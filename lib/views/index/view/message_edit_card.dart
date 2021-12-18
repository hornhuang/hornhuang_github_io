import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/dialog/login_dialog.dart';

class MessageEditCard extends StatelessWidget {
  late BuildContext context;

  MessageEditCard({Key? key}) : super(key: key);

  Widget _buildLoginBtn() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(4),
      color: Theme.of(context).primaryColor,
      child: TextButton(
        child: Text('登录'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return LoginDialog();
            },
          );
        },
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(4),
      color: Theme.of(context).primaryColor,
      child: TextButton(
        child: Text('注册'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return LoginDialog();
            },
          );
        },
      ),
    );
  }

  Widget _buildShareBtn() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(4),
      color: Theme.of(context).primaryColor,
      child: TextButton(
        child: Text('发布 + '),
        onPressed: () {},
      ),
    );
  }

  Widget _buildDonateBtn() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(4),
      color: Theme.of(context).primaryColor,
      child: TextButton(
        child: Text('打赏'),
        onPressed: () {},
      ),
    );
  }

  showLoginDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: Text("用户登录"),
            titlePadding: EdgeInsets.all(10),
            backgroundColor: Colors.amber,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            children: <Widget>[
              ListTile(
                title: Center(
                  child: Text("Item_1"),
                ),
              ),
              ListTile(
                title: Center(
                  child: Text("Item_2"),
                ),
              ),
              ListTile(
                  title: Center(
                    child: Text("登录"),
                  ),
                  onTap: () {}),
              ListTile(
                  title: Center(
                    child: Text("注册"),
                  ),
                  onTap: () {}),
              ListTile(
                title: Center(
                  child: Text("取消"),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget _buildTitle() {
    return Container(
      child: Text(
        "留言板",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextEditingController controller = TextEditingController();

  Widget _buildEditWidget() {
    return Container(
      height: 16,
      child: TextField(
        controller: controller,
      ),
    );
  }

  Widget _buildConfirmBtn() {
    return Container(
      width: 30,
      height: 16,
      margin: EdgeInsets.all(4),
      color: Theme.of(context).primaryColor,
      child: TextButton(
        child: Text('发布'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) {
              return LoginDialog();
            },
          );
        },
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 72,
      width: 256,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          SizedBox(height: 8,),
          Row(
            children: [
              Expanded(
                child: _buildEditWidget(),
              ),
              SizedBox(width: 8,),
              _buildConfirmBtn(),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      child: _buildBody(),
    );
  }
}
