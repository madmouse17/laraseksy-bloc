part of 'date_bloc.dart';

abstract class DateEvent extends Equatable {
  const DateEvent();

  @override
  List<Object> get props => [];
}

class IncrementDateEvent extends DateEvent {
  @override
  List<Object> get props => [];
}

class DecrementDateEvent extends DateEvent {
  List<Object> get props => [];
}

class ChooseDateEvent extends DateEvent {
  DateTime now;

  ChooseDateEvent({required this.now});
  List<Object> get props => [now];
}
