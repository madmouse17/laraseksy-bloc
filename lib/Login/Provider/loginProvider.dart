import 'dart:convert';

import 'package:laraseksy_bloc/Login/Models/loginModels.dart';
import 'package:laraseksy_bloc/Models/errorModels.dart';
import 'package:laraseksy_bloc/utils/apiRequest.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';

class LoginProvider {
  postLoginData({
    Function()? beforeSend,
    Function(LoginModels value)? onSuccess,
    Function(String error)? onError,
    Function(ErrorModels error)? onErrorData,
    final Map<String, dynamic>? dataQuery,
  }) {
    ApiRequest(url: ApiURL.login, dataQuery: dataQuery).post(
        // beforeSend: () {
        //   beforeSend!();
        // },
        // onSuccess: (data) {
        //   onSuccess!(loginModelsFromJson(jsonEncode(data)));
        // },
        // onErrorData: (error) {
        //   onErrorData!(ErrorModels.fromJson(error));
        // },
        // onError: (error) {
        //   onError!(error);
        // },
        );
  }
}
