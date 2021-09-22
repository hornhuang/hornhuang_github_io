part of 'login_bloc.dart';

// main_event：这里是执行的各类事件，有点类似fish_redux的action层
@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginStartEvent extends LoginEvent {

  const LoginStartEvent();

  @override
  List<Object> get props => [];

}

class _LoginSucceedEvent extends LoginEvent {

  final BmobUser user;

  const _LoginSucceedEvent({required this.user});

  @override
  List<Object> get props => [user];

}

class _LoginFailedEvent extends LoginEvent {

  final String errorMsg;

  const _LoginFailedEvent({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];

}

class RegisterStartEvent extends LoginEvent {

  const RegisterStartEvent();

  @override
  List<Object> get props => [];

}

class _RegisterSucceedEvent extends LoginEvent {

  final BmobRegistered data;

  const _RegisterSucceedEvent({required this.data});

  @override
  List<Object> get props => [data];

}

class _RegisterFailedEvent extends LoginEvent {

  final String errorMsg;

  const _RegisterFailedEvent({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];

}

class TypeChangedEvent extends LoginEvent {
  LoginDialogType type;

  TypeChangedEvent({required this.type});

  @override
  List<Object> get props => [type];
}