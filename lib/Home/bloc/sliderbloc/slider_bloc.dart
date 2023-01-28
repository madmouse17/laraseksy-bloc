import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:laraseksy_bloc/Home/Models/sliderModels.dart';
import 'package:laraseksy_bloc/Models/errorModels.dart';
import 'package:laraseksy_bloc/utils/apiRequest.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';
import 'package:meta/meta.dart';

part 'slider_event.dart';
part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial()) {
    on<SliderEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await ApiRequest(url: ApiURL.pengumuman).get().then((value) async {
          print(value.toString());
          emit(
            LoadedState(
              sliderModels: sliderModelsFromJson(
                value,
              ),
            ),
          );
        });
      } on DioError catch (e) {
        if (e.response != null) {
          emit(
            ErrorState(
              errorModels: errorModelsFromJson(
                e.response.toString(),
              ),
            ),
          );
        } else {
          emit(
            ErrorState(
              errorModels: ErrorModels(
                message: e.message.toString(),
                errors: Errors(
                  failed: [e.message.toString()],
                ),
              ),
            ),
          );
        }
      }
    });
    on<CurrentSlidersEvent>((event, emit) {
      CurrentSlidersState(currentsSlider: event.currentSlider);
    });
  }
}
