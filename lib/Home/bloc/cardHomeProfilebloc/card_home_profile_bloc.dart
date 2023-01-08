import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:laraseksy_bloc/secureStorage/hiveSecure.dart';
import 'package:laraseksy_bloc/secureStorage/keyStorage.dart';

part 'card_home_profile_event.dart';
part 'card_home_profile_state.dart';

class CardHomeProfileBloc
    extends Bloc<CardHomeProfileEvent, CardHomeProfileState> {
  CardHomeProfileBloc()
      : super(CardHomeProfileInitial(
            id: '',
            kelas: '',
            kelasId: '',
            nama: '',
            semester: 0,
            semesteranId: '',
            tahunajaran: '',
            tahunajaranId: '')) {
    on<ProfileHomeEvent>((event, emit) async {
      Box<dynamic> encrypt = await HiveSecure.openBox(key: BoxKey.siswa);
      final siswa = await encrypt.get(BoxKey.siswa);
      emit(CardHomeProfileInitial(
          nama: siswa?[KeyStorage.siswaNama],
          id: siswa?[KeyStorage.siswaId],
          kelas: siswa?[KeyStorage.siswaKelas],
          kelasId: siswa?[KeyStorage.siswaKelasId],
          semester: siswa?[KeyStorage.siswaSemester],
          semesteranId: siswa?[KeyStorage.siswaSemesterId],
          tahunajaran: siswa?[KeyStorage.siswaTahunajaran],
          tahunajaranId: siswa?[KeyStorage.siswaTahunajaranId]));
    });
  }
}
