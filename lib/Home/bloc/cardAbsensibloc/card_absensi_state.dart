part of 'card_absensi_bloc.dart';

abstract class CardAbsensiState extends Equatable {
  const CardAbsensiState();

  @override
  List<Object> get props => [];
}

class CardAbsensiInitial extends CardAbsensiState {}

class LoadedState extends CardAbsensiState {
  CardAbsensiModels cardAbsensiModels;
  String wali;
  LoadedState({required this.cardAbsensiModels, required this.wali});

  @override
  List<Object> get props => [cardAbsensiModels];
}

class LoadingState extends CardAbsensiState {}

class ErrorState extends CardAbsensiState {
  ErrorModels? errorModels;
  String? waliKelas;

  ErrorState({required this.errorModels, required this.waliKelas});
}
