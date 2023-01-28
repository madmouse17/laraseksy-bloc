// To parse this JSON data, do
//
//     final sliderModels = sliderModelsFromJson(jsonString);

import 'dart:convert';

SliderModels sliderModelsFromJson(String str) =>
    SliderModels.fromJson(json.decode(str));

String sliderModelsToJson(SliderModels data) => json.encode(data.toJson());

class SliderModels {
  SliderModels({
    required this.type,
    required this.title,
    required this.data,
  });

  String type;
  String title;
  List<Sliders> data;

  factory SliderModels.fromJson(Map<String, dynamic> json) => SliderModels(
        type: json["type"],
        title: json["title"],
        data: List<Sliders>.from(json["data"].map((x) => Sliders.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Sliders {
  Sliders({
    required this.id,
    required this.image,
  });

  String id;
  String image;

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
