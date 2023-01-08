part of 'card_home_profile_bloc.dart';

abstract class CardHomeProfileState extends Equatable {
  String nama, kelas, tahunajaran, id, tahunajaranId, semesteranId, kelasId;

  int semester;
  CardHomeProfileState(
      {required this.nama,
      required this.id,
      required this.kelas,
      required this.kelasId,
      required this.semester,
      required this.semesteranId,
      required this.tahunajaran,
      required this.tahunajaranId});
  @override
  List<Object> get props => [];
}

class CardHomeProfileInitial extends CardHomeProfileState {
  CardHomeProfileInitial(
      {required super.nama,
      required super.id,
      required super.kelas,
      required super.kelasId,
      required super.semester,
      required super.semesteranId,
      required super.tahunajaran,
      required super.tahunajaranId});
}

class ProfileHomeState extends CardHomeProfileState {
  ProfileHomeState(
      {required super.nama,
      required super.id,
      required super.kelas,
      required super.kelasId,
      required super.semester,
      required super.semesteranId,
      required super.tahunajaran,
      required super.tahunajaranId});

  @override
  List<Object> get props => [
        nama,
        id,
        kelas,
        kelasId,
        tahunajaran,
        tahunajaranId,
        semester,
        semesteranId
      ];
}
