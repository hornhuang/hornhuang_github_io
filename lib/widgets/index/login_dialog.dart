import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  ListTile _buildTextField(String hint, TextEditingController controller) {
    return ListTile(
      title: Center(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: hint,
            ),
          )
      ),
    );
  }

  ///用户名和密码登录
  _login() {
    BmobUser bmobUserRegister = BmobUser();
    bmobUserRegister.username = _nameController.text;
    bmobUserRegister.password = _passwordController.text;
    bmobUserRegister.login().then((BmobUser bmobUser) {
      _showToast(bmobUser.getObjectId() + "\n" + bmobUser.username);
    }).catchError((e) {
      _showToast(BmobError.convert(e).error);
    });
  }

  ///用户名密码注册
  _register() {
    BmobUser bmobUserRegister = BmobUser();
    bmobUserRegister.username = _nameController.text;
    bmobUserRegister.password = _passwordController.text;
    bmobUserRegister.register().then((BmobRegistered data) {
      _showToast(data.objectId);
    }).catchError((e) {
      _showToast(BmobError.convert(e).error);
    });
  }

  _showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 6,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("SimpleDialog"),
      titlePadding: EdgeInsets.all(10),
      backgroundColor: Colors.amber,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      children: <Widget>[
        _buildTextField("账户", _nameController),
        _buildTextField("密码", _passwordController),
        ListTile(
            title: Center(
              child: Text("登录"),
            ),
            onTap: () {
              _showToast("66666666");
              // _login();
            }),
        ListTile(
            title: Center(
              child: Text("注册"),
            ),
            onTap: () {
              _register();
            }),
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
  }
}