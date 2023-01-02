import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sandivisible_event.dart';
part 'sandivisible_state.dart';

class SandivisibleBloc extends Bloc<SandivisibleEvent, SandivisibleState> {
  SandivisibleBloc() : super(SandiVisibleState(visible: true)) {
    on<SandiVisibleEvent>((event, emit) {
      print('onhandle ' + state.visible.toString());
      // Future.delayed(Duration(seconds: 2));
      emit(SandiVisibleState(visible: !state.visible));
    });
  }
}
