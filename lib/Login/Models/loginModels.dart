// To parse this JSON data, do
//
//     final loginModels = loginModelsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModels loginModelsFromJson(String str) =>
    LoginModels.fromJson(json.decode(str));

String loginModelsToJson(LoginModels data) => json.encode(data.toJson());

class LoginModels {
  LoginModels({
    required this.type,
    required this.title,
    required this.data,
  });

  String type;
  String title;
  LoginModelsData data;

  factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
        type: json["type"],
        title: json["title"],
        data: LoginModelsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "data": data.toJson(),
      };
}

class LoginModelsData {
  LoginModelsData({
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  String accessToken;
  String tokenType;
  DataData data;

  factory LoginModelsData.fromJson(Map<String, dynamic> json) =>
      LoginModelsData(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data.toJson(),
      };
}

class DataData {
  DataData({
    required this.id,
    required this.nama,
  });

  String id;
  String nama;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
