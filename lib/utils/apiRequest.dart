import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/Models/errorModels.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/secureStorage/keyStorage.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';
import 'package:laraseksy_bloc/secureStorage/hiveSecure.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';
import 'package:laraseksy_bloc/secureStorage/secureStorage.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? dataQuery;
  final String? token;

  static String? accessToken;
  static String? tokenType;

  static getToken() async {
    var box = await HiveSecure.openBox(key: BoxKey.token);
    var tok = await box.get(BoxKey.token);
    accessToken = tok?[KeyStorage.accesToken];
    tokenType = tok?[KeyStorage.tokenType];

    log(accessToken!);
  }

  ApiRequest({required this.url, this.dataQuery, this.token});

  Dio _dio() {
    // Put your authorization token here
    print(ApiURL.baseURL);
    return Dio(
      BaseOptions(
        baseUrl: ApiURL.baseURL,
        headers: {
          '$tokenType': token ?? accessToken,
          'content-Type': 'application/json'
        },
      ),
    );
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onErrorData,
    Function(String error)? onError,
  }) async {
    try {
      var res = await _dio().get(url, queryParameters: dataQuery);
      if (onSuccess != null) onSuccess(res.data);
    } on DioError catch (e) {
      if (e.response != null) {
        if (onErrorData != null) onErrorData(e.response!.data);
      } else {
        if (onError != null) onError(e.message);
      }
    }
  }

  post({
    Function()? beforeSend,
    Function(dynamic success)? onSuccess,
    Function(dynamic error)? onErrorData,
    Function(String error)? onError,
  }) async {
    try {
      Response res = await _dio().post(url, data: dataQuery);

      if (onSuccess != null) onSuccess(res.data);
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
          ErrorModels error = errorModelsFromJson(e.response.toString());
          ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
              .showSnackBar(SnackBar(
            content: Text(error.errors.failed[0],
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: Pallete.redAccentColor,
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Login Ulang',
              textColor: Colors.white,
              onPressed: () => NavigationService.navigatorKey.currentState!
                  .popAndPushNamed(Routes.login),
            ),
          ));
          NavigationService.navigatorKey.currentState!
              .popAndPushNamed(Routes.login);
        } else {
          if (onErrorData != null) onErrorData(e.response!.data);
        }
      } else {
        ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
            .showSnackBar(SnackBar(
          content: Text(e.message,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Pallete.redAccentColor,
          action: SnackBarAction(
            label: 'Error',
            textColor: Colors.white,
            onPressed: () {
              NavigationService.navigatorKey.currentState!.pop();
            },
          ),
        ));
        if (onError != null) onError(e.message);
      }
    }
  }
}
