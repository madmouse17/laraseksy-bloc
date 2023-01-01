import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'date_event.dart';
part 'date_state.dart';

class DateBloc extends Bloc<DateEvent, DateState> {
  DateBloc() : super(DateInitial(now: DateTime.now())) {
    on<IncrementDateEvent>((event, emit) {
      emit(
        DateInitial(
          now: state.now.add(
            Duration(days: 1),
          ),
        ),
      );
    });
    on<DecrementDateEvent>((event, emit) {
      emit(
        DateInitial(
          now: state.now.subtract(
            Duration(days: 1),
          ),
        ),
      );
    });
    on<ChooseDateEvent>((event, emit) {
      emit(
        DateInitial(
          now: event.now,
        ),
      );
    });
  }
}
