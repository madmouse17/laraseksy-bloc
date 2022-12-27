import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(const ExampleInitial(counter: 0)) {
    on<IncrementEvent>((event, emit) {
      print('asdasd');
      return emit(ExampleInitial(counter: state.counter + 1));
    });
    on<DecrementEvent>(
        (event, emit) => emit(ExampleInitial(counter: state.counter - 1)));
  }

  // Stream<ExampleInitial> mapEventToState(ExampleEvent event) async* {
  //   if (state is IncrementEvent) {
  //     log(state.counter.toString());

  //     yield ExampleInitial(counter: state.counter + 1);
  //   } else if (state is DecrementEvent) {
  //     yield ExampleInitial(counter: state.counter - 1);
  //   }
  // }
}
