import 'dart:convert';
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
import 'package:laraseksy_bloc/utils/snackBarCustom.dart';

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
    getToken();
    return Dio(
      BaseOptions(
        baseUrl: ApiURL.baseURL,
        headers: {
          'Authorization':
              token != null ? 'Bearer $token' : 'Bearer $accessToken',
          'content-Type': 'application/json'
        },
      ),
    );
  }

  Future get() async {
    try {
      var res = await _dio().get(url, queryParameters: dataQuery);
      return jsonEncode(res.data);
    } on DioError {
      rethrow;
    }
  }

  Future post() async {
    try {
      Response res = await _dio().post(url, data: dataQuery);
      return jsonEncode(res.data);
    } on DioError {
      rethrow;
    }
  }
}
