import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, SandiVisibleState> {
  LoginBloc() : super(SandiVisibleState()) {
    on<SandiVisibleEvent>((event, emit) {
      return emit(SandiVisibleState(visible: state.visible = !state.visible));
    });
  }
}
