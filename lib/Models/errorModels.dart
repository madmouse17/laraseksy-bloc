// To parse this JSON data, do
//
//     final errorModels = errorModelsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ErrorModels errorModelsFromJson(String str) =>
    ErrorModels.fromJson(json.decode(str));

String errorModelsToJson(ErrorModels data) => json.encode(data.toJson());

class ErrorModels {
  ErrorModels({
    required this.message,
    required this.errors,
  });

  String message;
  Errors errors;

  factory ErrorModels.fromJson(Map<String, dynamic> json) => ErrorModels(
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  Errors({
    required this.failed,
  });

  List<String> failed;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        failed: List<String>.from(json["failed"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "failed": List<dynamic>.from(failed.map((x) => x)),
      };
}
