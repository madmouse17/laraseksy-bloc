import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/utils/apiRequest.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';
import 'package:laraseksy_bloc/utils/getIdSiswa.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';
import 'package:laraseksy_bloc/utils/snackBarCustom.dart';
import 'package:meta/meta.dart';

part 'saveimagepointbloc_event.dart';
part 'saveimagepointbloc_state.dart';

class SaveimagepointblocBloc
    extends Bloc<SaveimagepointblocEvent, SaveimagepointblocState> {
  SaveimagepointblocBloc() : super(SaveimagepointblocInitial()) {
    on<SaveimagepointblocEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        var id = await getIdSiswa.getId();
        var param = {'id': id, 'image_point': event.imagePoint};
        log(jsonEncode(param));
        await ApiRequest(url: ApiURL.saveImagePoint, dataQuery: param)
            .post()
            .then((value) async {
          log('$value');
          NavigationService.navigatorKey.currentState!
              .popAndPushNamed(Routes.home);

          AlertBottom().snackBarSuccessAlert(message: value);
        });
      } on DioError catch (e) {
        AlertBottom().onErrorAlertDioDefault(error: e);
      }
    });
  }
}
