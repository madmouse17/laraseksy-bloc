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
    required this.sekolah,
  });

  String accessToken;
  String tokenType;
  DataData data;
  Sekolah sekolah;

  factory LoginModelsData.fromJson(Map<String, dynamic> json) =>
      LoginModelsData(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        data: DataData.fromJson(json["data"]),
        sekolah: Sekolah.fromJson(json["sekolah"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "data": data.toJson(),
        "sekolah": sekolah.toJson(),
      };
}

class DataData {
  DataData({
    required this.id,
    required this.nama,
    required this.kelas,
  });

  String id;
  String nama;
  Kelas kelas;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        nama: json["nama"],
        kelas: Kelas.fromJson(json["kelas"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "kelas": kelas.toJson(),
      };
}

class Kelas {
  Kelas({
    required this.id,
    required this.kelas,
  });

  String id;
  String kelas;

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        kelas: json["kelas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas": kelas,
      };
}

class Sekolah {
  Sekolah({
    required this.id,
    required this.tahunajaran,
    required this.semester,
  });

  String id;
  Tahunajaran tahunajaran;
  Semester semester;

  factory Sekolah.fromJson(Map<String, dynamic> json) => Sekolah(
        id: json["id"],
        tahunajaran: Tahunajaran.fromJson(json["tahunajaran"]),
        semester: Semester.fromJson(json["semester"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tahunajaran": tahunajaran.toJson(),
        "semester": semester.toJson(),
      };
}

class Semester {
  Semester({
    required this.id,
    required this.semester,
  });

  String id;
  int semester;

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        id: json["id"],
        semester: json["semester"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "semester": semester,
      };
}

class Tahunajaran {
  Tahunajaran({
    required this.id,
    required this.tahun,
  });

  String id;
  String tahun;

  factory Tahunajaran.fromJson(Map<String, dynamic> json) => Tahunajaran(
        id: json["id"],
        tahun: json["tahun"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tahun": tahun,
      };
}
