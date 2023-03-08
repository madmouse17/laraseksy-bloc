import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laraseksy_bloc/ImagePoint/bloc/cekimagepoint_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
