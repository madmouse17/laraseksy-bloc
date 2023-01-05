import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:laraseksy_bloc/Login/Models/loginModels.dart';
import 'package:laraseksy_bloc/Login/Provider/loginProvider.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/secureStorage/hiveSecure.dart';
import 'package:laraseksy_bloc/secureStorage/keyStorage.dart';
import 'package:laraseksy_bloc/utils/apiRequest.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';
import 'package:laraseksy_bloc/utils/snackBarCustom.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    LoginProvider loginProvider = LoginProvider();
    on<LoginEventClick>((event, emit) async {
      emit(Loading());
      try {
        await ApiRequest(
                url: ApiURL.login,
                dataQuery: {'nis': event.nis, 'password': event.password})
            .post()
            .then((value) async {
          var loginData = loginModelsFromJson(value);
          await setLocal(value: loginData).then((_) async {
            await ApiRequest.getToken();
          });
          // print(value.toString());
          emit(
            Success(
              loginModels: loginData,
            ),
          );
          NavigationService.navigatorKey.currentState!
              .popAndPushNamed(Routes.home);
        });
      } on DioError catch (e) {
        AlertBottom().onErrorAlertDioDefault(error: e);
        emit(Error());
      }
    });
  }
  Future setLocal({required LoginModels value}) async {
    var data = value.data.data;
    var sekolah = value.data.sekolah;
    Box<dynamic> encrypt = await HiveSecure.openBox(key: BoxKey.siswa);

    await encrypt.put(BoxKey.siswa, {
      KeyStorage.siswaId: data.id,
      KeyStorage.siswaNama: data.nama,
      KeyStorage.siswaKelasId: data.kelas.id,
      KeyStorage.siswaKelas: data.kelas.kelas,
      KeyStorage.siswaTahunajaranId: sekolah.tahunajaran.id,
      KeyStorage.siswaTahunajaran: sekolah.tahunajaran.tahun,
      KeyStorage.siswaSemesterId: sekolah.semester.id,
      KeyStorage.siswaSemester: sekolah.semester.semester,
    });
    Box<dynamic> encryptToken = await HiveSecure.openBox(key: BoxKey.token);
    await encryptToken.put(BoxKey.token, {
      KeyStorage.tokenType: value.data.tokenType,
      KeyStorage.accesToken: value.data.accessToken
    });
    // final siswa = await encrypt.get('siswa');
    // print(siswa.toString());
  }
}
