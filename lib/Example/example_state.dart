part of 'example_bloc.dart';

@immutable
abstract class ExampleState extends Equatable {
  final int counter;

  const ExampleState({required this.counter});
  @override
  List<Object> get props => [counter];
}

class ExampleInitial extends ExampleState {
  const ExampleInitial({required super.counter});
}
