import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hornhuang_github_io/bloc/login/login_bloc.dart';

enum LoginDialogType {
  Login,
  Register
}

class LoginDialog extends StatefulWidget {
  LoginDialogType type;

  LoginDialog({this.type = LoginDialogType.Login, Key? key}) : super(key: key);

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  late LoginBloc _bloc;

  ListTile _buildTextField(String hint, TextEditingController controller) {
    return ListTile(
      title: Center(
          child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
        ),
      )),
    );
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

  _login() {
    if (widget.type != LoginDialogType.Login) {
      _bloc.add(TypeChangedEvent(type: LoginDialogType.Login));
      return;
    }
    LoginStartEvent event = LoginStartEvent();
    _bloc.add(event);
  }

  _register() {
    if (widget.type != LoginDialogType.Register) {
      _bloc.add(TypeChangedEvent(type: LoginDialogType.Register));
      return;
    }
    RegisterStartEvent event = RegisterStartEvent();
    _bloc.add(event);
  }

  Widget _buildLoginDialog(LoginState state) {
    if (state is LoginSucceedState) {
      Navigator.pop(context);
      _showToast("login succeed");
    } else if (state is LoginFailedState) {
      _showToast(state.errMsg);
    } else if (state is RegisterSucceedState) {
      Navigator.pop(context);
      _showToast("login succeed");
    } else if (state is RegisterFailedState) {
      _showToast(state.errMsg);
    } else if (state is TypeChangedState) {
      widget.type = state.type;
    }

    bool isLoginType = widget.type == LoginDialogType.Login;
    String title = isLoginType ? "登录" : "注册";

    return SimpleDialog(
      title: Center(
        child: Text(title),
      ),
      titlePadding: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      children: <Widget>[
        _buildTextField("账户", state.usernameController),
        _buildTextField("密码", state.passwordController),
        isLoginType ? SizedBox() : _buildTextField("再次输入密码", state.reInputPasswordController),
        ListTile(
            title: Center(
              child: Text("登录"),
            ),
            onTap: () {
              _login();
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        _bloc = BlocProvider.of(context);
        return _buildLoginDialog(state);
      }),
    );
  }
}
