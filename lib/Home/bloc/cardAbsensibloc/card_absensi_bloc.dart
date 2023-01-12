import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:laraseksy_bloc/Home/Models/cardAbsensiModels.dart';
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
      print('tanggal${event.tanggal}');
      Box<dynamic> encrypt = await HiveSecure.openBox(key: BoxKey.siswa);
      var data = encrypt.get(BoxKey.siswa);
      try {
        ApiRequest(url: ApiURL.jadwal, dataQuery: {
          'id': data?[KeyStorage.siswaId],
          'tanggal': event.tanggal
        }).post().then((value) async {
          emit(LoadedState(
              cardAbsensiModels: cardAbsensiModelsFromJson(value)!));
          print(value);
        });
      } on DioError catch (e) {
        AlertBottom().onErrorAlertDioDefault(error: e);
        Future.delayed(Duration(seconds: 2));
        print(e.toString());
        emit(ErrorState());
      }
    });
  }
}
