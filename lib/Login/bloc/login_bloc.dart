import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(SandiVisibleState(visible: true)) {
    on<SandiVisibleEvent>((event, emit) {
      print('onhandle ' + state.visible.toString());
      // Future.delayed(Duration(seconds: 2));
      emit(SandiVisibleState(visible: !state.visible));
    });
  }
}
