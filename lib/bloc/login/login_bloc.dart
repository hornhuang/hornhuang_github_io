import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

// main_bloc：这里就是咱们主要写逻辑的页面了
// mapEventToState方法只有一个参数，后面自动带了一个逗号，格式化代码就分三行了，建议删掉逗号，格式化代码。
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

  }
}
