part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class SandiVisibleEvent extends LoginEvent {
  const SandiVisibleEvent();
  @override
  List<Object> get props => [];
}
