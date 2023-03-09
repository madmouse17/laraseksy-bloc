import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/secureStorage/hiveSecure.dart';
import 'package:laraseksy_bloc/secureStorage/keyStorage.dart';
import 'package:laraseksy_bloc/utils/apiRequest.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';
import 'package:laraseksy_bloc/utils/snackBarCustom.dart';
part 'cekimagepoint_event.dart';
part 'cekimagepoint_state.dart';

class CekimagepointBloc extends Bloc<CekimagepointEvent, CekimagepointState> {
  CekimagepointBloc() : super(CekimagepointInitial()) {
    on<CekimagepointEvent>((event, emit) async {
      emit(LoadingImagePoint());
      Box<dynamic> encrypt = await HiveSecure.openBox(key: BoxKey.siswa);
      final siswa = await encrypt.get(BoxKey.siswa);
      var id = siswa?[KeyStorage.siswaId];
      try {
        await ApiRequest(url: ApiURL.cekImagePoint, parameter: id)
            .get()
            .then((value) async {
          log('cekimagepoint = ${jsonEncode(value)}');
          // print(value.toString());
          emit(
            LoadedImagePoint(),
          );
          NavigationService.navigatorKey.currentState!
              .popAndPushNamed(Routes.home);
        });
      } on DioError catch (e) {
        AlertBottom().onErrorAlertDioDefault(error: e);
        emit(ErrorImagePoint());
        NavigationService.navigatorKey.currentState!
            .popAndPushNamed(Routes.cekimagepoint);
      }
    });
  }
}
