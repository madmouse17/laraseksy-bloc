part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  bool visible;

  LoginState({required this.visible});
  @override
  List<Object> get props => [visible];
}

// class LoginInitial extends LoginState {
//   LoginInitial({required super.visible});
// }

class SandiVisibleState extends LoginState {
  SandiVisibleState({required super.visible});
  @override
  List<Object> get props => [visible];
}
