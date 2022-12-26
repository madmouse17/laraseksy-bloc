import 'dart:developer';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(const ExampleInitial(counter: 0));

  Stream<ExampleInitial> mapEventToState(ExampleEvent event) async* {
    if (state is IncrementEvent) {
      yield ExampleInitial(counter: state.counter + 1);
    } else if (state is DecrementEvent) {
      yield ExampleInitial(counter: state.counter - 1);
    }
  }
}
