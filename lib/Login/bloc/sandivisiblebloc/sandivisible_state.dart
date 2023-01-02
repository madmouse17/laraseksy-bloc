part of 'sandivisible_bloc.dart';

@immutable
abstract class SandivisibleState extends Equatable {
  bool visible;

  SandivisibleState({required this.visible});
  @override
  List<Object> get props => [visible];
}

// class SandivisibleInitial extends SandivisibleState {}

class SandiVisibleState extends SandivisibleState {
  SandiVisibleState({required super.visible});
  @override
  List<Object> get props => [visible];
}
