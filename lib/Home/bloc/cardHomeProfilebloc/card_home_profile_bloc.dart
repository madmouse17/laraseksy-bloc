import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:laraseksy_bloc/Home/Models/siswaDetailModels.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/secureStorage/hiveSecure.dart';
import 'package:laraseksy_bloc/secureStorage/keyStorage.dart';
import 'package:laraseksy_bloc/utils/apiRequest.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';
import 'package:laraseksy_bloc/utils/snackBarCustom.dart';

part 'card_home_profile_event.dart';
part 'card_home_profile_state.dart';

class CardHomeProfileBloc
    extends Bloc<CardHomeProfileEvent, CardHomeProfileState> {
  CardHomeProfileBloc() : super(CardHomeProfileInitial(
            //     id: '',
            //     kelas: '',
            //     kelasId: '',
            //     nama: '',
            //     semester: 0,
            //     semesteranId: '',
            //     tahunajaran: '',
            //     tahunajaranId: ''
            )) {
    on<ProfileHomeEvent>((event, emit) async {
      emit(LoadingProfileHome());
      Box<dynamic> encrypt = await HiveSecure.openBox(key: BoxKey.siswa);
      final siswa = await encrypt.get(BoxKey.siswa);
      var id = siswa?[KeyStorage.siswaId];
      try {
        await ApiRequest(url: ApiURL.siswaDetails, parameter: id)
            .get()
            .then((value) async {
          var siswaDetail = siswaDetailModelsFromJson(value);
          log('detail = ${jsonEncode(siswaDetail)}');
          encrypt.put(BoxKey.waliKelas,
              {KeyStorage.waliNama: siswaDetail.data.wali.nama});

          // print(value.toString());
          emit(
            SuccessProfileHome(siswaDetailModels: siswaDetail),
          );
        });
      } on DioError catch (e) {
        AlertBottom().onErrorAlertDioDefault(error: e);
        emit(ErrorProfileHome());
      }
    });

    // Box<dynamic> encrypt = await HiveSecure.openBox(key: BoxKey.siswa);
    // final siswa = await encrypt.get(BoxKey.siswa);
    // emit(CardHomeProfileInitial(
    //     nama: siswa?[KeyStorage.siswaNama],
    //     id: siswa?[KeyStorage.siswaId],
    //     kelas: siswa?[KeyStorage.siswaKelas],
    //     kelasId: siswa?[KeyStorage.siswaKelasId],
    //     semester: siswa?[KeyStorage.siswaSemester],
    //     semesteranId: siswa?[KeyStorage.siswaSemesterId],
    //     tahunajaran: siswa?[KeyStorage.siswaTahunajaran],
    //     tahunajaranId: siswa?[KeyStorage.siswaTahunajaranId]));
    // });
  }
}
