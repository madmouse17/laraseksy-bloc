part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  bool visible;
  LoginState({this.visible = true});
  @override
  List<Object> get props => [visible];
}

class LoginInitial extends LoginState {}

class SandiVisibleState extends LoginState {
  SandiVisibleState({super.visible});
}
