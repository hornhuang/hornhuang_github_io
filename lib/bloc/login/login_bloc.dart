import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_plugin/bmob/response/bmob_error.dart';
import 'package:data_plugin/bmob/response/bmob_registered.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hornhuang_github_io/widgets/dialog/login_dialog.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

/// main_bloc：这里就是咱们主要写逻辑的页面了
/// mapEventToState方法只有一个参数，后面自动带了一个逗号，格式化代码就分三行了，建议删掉逗号，格式化代码。
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  ///用户名和密码登录
  _login(LoginStartEvent event) {
    BmobUser bmobUserRegister = BmobUser();
    bmobUserRegister.username = state.usernameController.text;
    bmobUserRegister.password = state.passwordController.text;
    bmobUserRegister.login().then((BmobUser bmobUser) {
      _LoginSucceedEvent event = _LoginSucceedEvent(user: bmobUser);
      add(event);
    }).catchError((e) {
      _LoginFailedEvent event = _LoginFailedEvent(errorMsg: BmobError.convert(e).error);
      add(event);
    });
  }

  ///用户名密码注册
  _register(RegisterStartEvent event) {
    String username = state.usernameController.text;
    String password = state.passwordController.text;
    if (username != password) {
      _RegisterFailedEvent event = _RegisterFailedEvent(errorMsg: "两次输入密码不同");
      add(event);
      return;
    }
    BmobUser bmobUserRegister = BmobUser();
    bmobUserRegister.username = username;
    bmobUserRegister.password = password;
    bmobUserRegister.register().then((BmobRegistered data) {
      _RegisterSucceedEvent event = _RegisterSucceedEvent(data: data);
      add(event);
    }).catchError((e) {
      _RegisterFailedEvent event = _RegisterFailedEvent(errorMsg: BmobError.convert(e).error);
      add(event);
    });
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    /// main_view中添加的事件，会在此处回调，此处处理完数据，将数据yield，BlocBuilder就会刷新组件
    if (event is LoginStartEvent) {
      /// 获取到event事件传递过来的值,咱们拿到这值塞进MainState中
      /// 直接在state上改变内部的值,然后yield,只能触发一次BlocBuilder,它内部会比较上次MainState对象,如果相同,就不build
      _login(event);
      yield LoggingState();
    } else if (event is RegisterStartEvent) {
      _register(event);
      yield RegisteringState();
    } else if (event is _LoginSucceedEvent) {
      yield LoginSucceedState();
    } else if (event is _LoginFailedEvent) {
      yield LoginFailedState(errMsg: event.errorMsg);
    } else if (event is _RegisterSucceedEvent) {
      yield RegisterSucceedState();
    } else if (event is _RegisterFailedEvent) {
      yield RegisterFailedState(errMsg: event.errorMsg);
    } else if (event is TypeChangedEvent) {
      yield TypeChangedState(type: event.type);
    }
  }
}
