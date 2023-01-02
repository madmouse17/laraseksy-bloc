import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:laraseksy_bloc/Models/errorModels.dart';
import 'package:laraseksy_bloc/routes/routes.dart';
import 'package:laraseksy_bloc/utils/Pallet.dart';
import 'package:laraseksy_bloc/utils/apiURL.dart';
import 'package:laraseksy_bloc/utils/navigatorKey.dart';
import 'package:laraseksy_bloc/utils/secureStorage.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? dataQuery;
  final String? token;

  static String? apiToken;
  static getToken() async {
    apiToken = await SecureStorage.init.read(key: 'token');
    log(apiToken!);
  }

  ApiRequest({required this.url, this.dataQuery, this.token});

  Dio _dio() {
    // Put your authorization token here
    print(ApiURL.baseURL);
    return Dio(
      BaseOptions(
        baseUrl: ApiURL.baseURL,
        headers: {
          // 'Bearer': token ?? apiToken,
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
      print(e);
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
    print('b');
    try {
      print(dataQuery);
      print(url);

      Response res = await _dio().post(url, data: dataQuery);
      print('c' + res.toString());

      if (onSuccess != null) onSuccess(res.data);
    } on DioError catch (e) {
      print(e.response);

      if (e.response != null) {
        // if (e.response!.statusCode == 401) {
        //   ErrorModels error = errorModelsFromJson(e.response.toString());
        //   SnackBar(
        //     content: Text(error.errors.failed.toString(),
        //         style: TextStyle(
        //             color: Pallete.redDarkColor, fontWeight: FontWeight.bold)),
        //     backgroundColor: Pallete.redAccentColor,
        //     action: SnackBarAction(
        //       label: 'Login Ulang',
        //       onPressed: () => NavigationService.navigatorKey.currentState!
        //           .popAndPushNamed(Routes.login),
        //     ),
        //   );
        // } else {
        if (onErrorData != null) onErrorData(e.response!.data);
        // }
      } else {
        if (onError != null) onError(e.message);
      }
    }
  }
}
