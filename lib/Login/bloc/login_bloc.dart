import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(SandiVisibleState(visible: true)) {
    on<SandiVisibleEvent>((event, emit) {
      print(state.visible.toString());
      return emit(SandiVisibleState(visible: state.visible = !state.visible));
    });
  }
}
