// To parse this JSON data, do
//
//     final cardAbsensiModels = cardAbsensiModelsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CardAbsensiModels? cardAbsensiModelsFromJson(String str) =>
    CardAbsensiModels.fromJson(json.decode(str));

String cardAbsensiModelsToJson(CardAbsensiModels? data) =>
    json.encode(data!.toJson());

class CardAbsensiModels {
  CardAbsensiModels({
    required this.type,
    required this.title,
    required this.data,
  });

  String? type;
  String? title;
  Data? data;

  factory CardAbsensiModels.fromJson(Map<String, dynamic> json) =>
      CardAbsensiModels(
        type: json["type"],
        title: json["title"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.day,
    required this.jadwaldetail,
    required this.waliKelas,
  });

  Day? day;
  List<Jadwaldetail?>? jadwaldetail;
  WaliKelas? waliKelas;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        day: Day.fromJson(json["day"]),
        jadwaldetail: json["jadwaldetail"] == null
            ? []
            : List<Jadwaldetail?>.from(
                json["jadwaldetail"]!.map((x) => Jadwaldetail.fromJson(x))),
        waliKelas: WaliKelas.fromJson(json["wali_kelas"]),
      );

  Map<String, dynamic> toJson() => {
        "day": day!.toJson(),
        "jadwaldetail": jadwaldetail == null
            ? []
            : List<dynamic>.from(jadwaldetail!.map((x) => x!.toJson())),
        "wali_kelas": waliKelas!.toJson(),
      };
}

class Day {
  Day({
    required this.id,
    required this.hari,
  });

  String? id;
  String? hari;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["id"],
        hari: json["hari"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
      };
}

class Jadwaldetail {
  Jadwaldetail({
    required this.id,
    required this.mulai,
    required this.selesai,
    required this.guru,
    required this.mapel,
  });

  dynamic id;
  String? mulai;
  String? selesai;
  Guru? guru;
  Mapel? mapel;

  factory Jadwaldetail.fromJson(Map<String, dynamic> json) => Jadwaldetail(
        id: json["id"],
        mulai: json["mulai"],
        selesai: json["selesai"],
        guru: Guru.fromJson(json["guru"]),
        mapel: Mapel.fromJson(json["mapel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mulai": mulai,
        "selesai": selesai,
        "guru": guru!.toJson(),
        "mapel": mapel!.toJson(),
      };
}

class Guru {
  Guru({
    required this.id,
    required this.nama,
  });

  dynamic id;
  String? nama;

  factory Guru.fromJson(Map<String, dynamic> json) => Guru(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}

class Mapel {
  Mapel({
    required this.id,
    required this.mapel,
  });

  dynamic id;
  String? mapel;

  factory Mapel.fromJson(Map<String, dynamic> json) => Mapel(
        id: json["id"],
        mapel: json["mapel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mapel": mapel,
      };
}

class WaliKelas {
  WaliKelas({
    required this.id,
    required this.nama,
  });

  String? id;
  String? nama;

  factory WaliKelas.fromJson(Map<String, dynamic> json) => WaliKelas(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
