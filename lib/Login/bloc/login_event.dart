part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class SandiVisibleEvent extends LoginEvent {
  bool visible;

  SandiVisibleEvent({required this.visible});
  @override
  List<Object> get props => [visible];
}
