part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class CurrentSliderEvent extends HomeEvent {
  final int currentSlider;

  CurrentSliderEvent({required this.currentSlider});

  @override
  List<Object> get props => [currentSlider];
}
