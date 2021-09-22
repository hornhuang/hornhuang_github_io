part of 'login_bloc.dart';

// main_state：状态数据放在这里保存，中转
class LoginState {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _reInputPasswordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get reInputPasswordController => _reInputPasswordController;

  // GestureTapCallback? onLoginTap;
  // GestureTapCallback? onRegisterTap;
  // GestureTapCallback? onShowRegisterTap;
  // GestureTapCallback? onShowLoginTap;
  // GestureTapCallback? onCancelTap;

  // LoginState(
  //     {this.onLoginTap,
  //     this.onRegisterTap,
  //     this.onShowRegisterTap,
  //     this.onShowLoginTap,
  //     this.onCancelTap});
}

class LoginStartState extends LoginState {

}

class LoggingState extends LoginState {

}

class LoginSucceedState extends LoginState {

}

class LoginFailedState extends LoginState {
  String errMsg;

  LoginFailedState({required this.errMsg});
}

class RegisteringState extends LoginState {

}

class RegisterSucceedState extends LoginState {

}

class RegisterFailedState extends LoginState {
  String errMsg;

  RegisterFailedState({required this.errMsg});
}

class TypeChangedState extends LoginState {
  LoginDialogType type;

  TypeChangedState({required this.type});
}