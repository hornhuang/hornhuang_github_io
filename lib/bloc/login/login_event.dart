part of 'login_bloc.dart';

// main_event：这里是执行的各类事件，有点类似fish_redux的action层
@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class UserLoginEvent extends LoginEvent {

  final int selectedIndex;

  const UserLoginEvent({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];

}

class UserRegisterEvent extends LoginEvent {

  final int selectedIndex;

  const UserRegisterEvent({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];

}