// To parse this JSON data, do
//
//     final successModels = successModelsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SuccessModels successModelsFromJson(String str) =>
    SuccessModels.fromJson(json.decode(str));

String successModelsToJson(SuccessModels data) => json.encode(data.toJson());

class SuccessModels {
  SuccessModels({
    required this.type,
    required this.title,
    required this.message,
  });

  String type;
  String title;
  String message;

  factory SuccessModels.fromJson(Map<String, dynamic> json) => SuccessModels(
        type: json["type"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "message": message,
      };
}
