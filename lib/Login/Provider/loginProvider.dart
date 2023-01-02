import 'dart:convert';

import 'package:laraseksy_bloc/Login/Models/loginModels.dart';
import 'package:laraseksy_bloc/utils/apiRequest.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';

class LoginProvider {
  postLoginData({
    Function()? beforeSend,
    Function(LoginModels value)? onSuccess,
    Function(String error)? onError,
    Function(dynamic error)? onErrorData,
    final Map<String, dynamic>? dataQuery,
  }) {
    ApiRequest(url: ApiURL.login, dataQuery: dataQuery).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        print(data);
        onSuccess!(loginModelsFromJson(jsonEncode(data)));
      },
      onErrorData: (error) => {if (onErrorData != null) onErrorData(error)},
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
