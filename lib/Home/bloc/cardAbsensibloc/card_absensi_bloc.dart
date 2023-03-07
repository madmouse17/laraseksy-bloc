import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:laraseksy_bloc/Home/Models/cardAbsensiModels.dart';
import 'package:laraseksy_bloc/Models/errorModels.dart';
import 'package:laraseksy_bloc/secureStorage/hiveSecure.dart';
import 'package:laraseksy_bloc/secureStorage/keyStorage.dart';
import 'package:laraseksy_bloc/utils/apiRequest.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';
import 'package:laraseksy_bloc/utils/snackBarCustom.dart';

part 'card_absensi_event.dart';
part 'card_absensi_state.dart';

class CardAbsensiBloc extends Bloc<CardAbsensiEvent, CardAbsensiState> {
  CardAbsensiBloc() : super(CardAbsensiInitial()) {
    on<AbsensiLoadedEvent>((event, emit) async {
      // TODO: implement event handler
      emit(LoadingState());
      Box<dynamic> encrypt = await HiveSecure.openBox(key: BoxKey.siswa);
      var data = encrypt.get(BoxKey.siswa);
      var param = {'id': data?[KeyStorage.siswaId], 'tgl': event.tanggal};
      try {
        log('tanggal $param');

        await ApiRequest(url: ApiURL.jadwal, dataQuery: param)
            .post()
            .then((value) async {
          // log(value.toString());
          var datahome = cardAbsensiModelsFromJson(value);
          var wali = encrypt.get(BoxKey.waliKelas);
          emit(LoadedState(
            cardAbsensiModels: datahome,
            wali: wali?[KeyStorage.waliNama],
          ));
        });
      } on DioError catch (e) {
        var wali = encrypt.get(BoxKey.waliKelas);

        if (e.response != null) {
          emit(
            ErrorState(
              errorModels: errorModelsFromJson(
                e.response.toString(),
              ),
              waliKelas: wali?[KeyStorage.waliNama],
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
              waliKelas: wali?[KeyStorage.waliNama],
            ),
          );
        }
        // AlertBottom().onErrorAlertDioDefault(error: e);
        // log(e.response.toString());

      }
    });
  }
}
