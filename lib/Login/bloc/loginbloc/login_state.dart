part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  // bool visible;

  // LoginState({required this.visible});
  // @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  // LoginInitial({required super.visible});
}

class Loading extends LoginState {}

class Success extends LoginState {
  LoginModels loginModels;
  Success({required this.loginModels});

  List<Object> get props => [loginModels];
}

class Error extends LoginState {}
