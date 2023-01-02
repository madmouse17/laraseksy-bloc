part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginEventClick extends LoginEvent {
  final String nis;
  final String password;

  const LoginEventClick({required this.nis, required this.password});
  @override
  List<Object> get props => [nis, password];
}
