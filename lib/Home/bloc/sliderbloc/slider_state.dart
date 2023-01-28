part of 'slider_bloc.dart';

@immutable
abstract class SliderState extends Equatable {}

class SliderInitial extends SliderState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SliderState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class LoadedState extends SliderState {
  SliderModels sliderModels;
  LoadedState({required this.sliderModels});
  @override
  List<Object> get props => [sliderModels];
}

// ignore: must_be_immutable
class ErrorState extends SliderState {
  ErrorModels errorModels;
  ErrorState({required this.errorModels});
  @override
  List<Object> get props => [];
}

class CurrentSlidersState extends SliderState {
  CurrentSlidersState({required this.currentsSlider});
  final int currentsSlider;
  List<Object> get props => [currentsSlider];
}
