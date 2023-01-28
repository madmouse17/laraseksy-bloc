part of 'slider_bloc.dart';

@immutable
class SliderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrentSlidersEvent extends SliderEvent {
  int currentSlider = 0;

  CurrentSlidersEvent({required this.currentSlider});

  @override
  List<Object> get props => [currentSlider];
}
