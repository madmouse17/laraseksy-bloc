part of 'example_bloc.dart';

@immutable
abstract class ExampleEvent extends Equatable {
  const ExampleEvent();
  @override
  List<Object> get props => [];
}

class IncrementEvent extends ExampleEvent {}

class DecrementEvent extends ExampleEvent {}
