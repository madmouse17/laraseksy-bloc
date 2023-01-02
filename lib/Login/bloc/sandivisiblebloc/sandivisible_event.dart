part of 'sandivisible_bloc.dart';

@immutable
abstract class SandivisibleEvent extends Equatable {}

class SandiVisibleEvent extends SandivisibleEvent {
  bool visible;

  SandiVisibleEvent({required this.visible});
  @override
  List<Object> get props => [visible];
}
