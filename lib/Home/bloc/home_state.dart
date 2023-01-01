part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({required this.currentSlider});
  final int currentSlider;

  @override
  List<Object> get props => [currentSlider];
}

class CurrentSliderState extends HomeState {
  CurrentSliderState({required super.currentSlider});
  List<Object> get props => [currentSlider];
}
