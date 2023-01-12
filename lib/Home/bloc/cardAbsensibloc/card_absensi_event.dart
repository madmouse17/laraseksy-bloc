part of 'card_absensi_bloc.dart';

abstract class CardAbsensiEvent extends Equatable {
  const CardAbsensiEvent();

  @override
  List<Object> get props => [];
}

class AbsensiLoadedEvent extends CardAbsensiEvent {
  String tanggal;
  AbsensiLoadedEvent({required this.tanggal});

  @override
  List<Object> get props => [tanggal];
}
