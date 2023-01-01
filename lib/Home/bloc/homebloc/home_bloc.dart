import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(CurrentSliderState(currentSlider: 0)) {
    on<CurrentSliderEvent>((event, emit) {
      //print('event:' + event.currentSlider.toString());

      emit(CurrentSliderState(currentSlider: event.currentSlider));
      // print('state :' + state.currentSlider.toString());
    });
  }
}
