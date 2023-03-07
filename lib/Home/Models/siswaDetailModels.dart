// To parse this JSON data, do
//
//     final siswaDetailModels = siswaDetailModelsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SiswaDetailModels siswaDetailModelsFromJson(String str) =>
    SiswaDetailModels.fromJson(json.decode(str));

String siswaDetailModelsToJson(SiswaDetailModels data) =>
    json.encode(data.toJson());

class SiswaDetailModels {
  SiswaDetailModels({
    required this.type,
    required this.title,
    required this.data,
  });

  String type;
  String title;
  Data data;

  factory SiswaDetailModels.fromJson(Map<String, dynamic> json) =>
      SiswaDetailModels(
        type: json["type"],
        title: json["title"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.siswa,
    required this.sekolah,
    required this.wali,
  });

  Siswa siswa;
  Sekolah sekolah;
  Wali wali;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        siswa: Siswa.fromJson(json["siswa"]),
        sekolah: Sekolah.fromJson(json["sekolah"]),
        wali: Wali.fromJson(json["wali"]),
      );

  Map<String, dynamic> toJson() => {
        "siswa": siswa.toJson(),
        "sekolah": sekolah.toJson(),
        "wali": wali.toJson(),
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

class Siswa {
  Siswa({
    required this.id,
    required this.nama,
    required this.kelas,
  });

  String id;
  String nama;
  Kelas kelas;

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
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
    required this.jurusan,
  });

  String id;
  String kelas;
  Jurusan jurusan;

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        kelas: json["kelas"],
        jurusan: Jurusan.fromJson(json["jurusan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas": kelas,
        "jurusan": jurusan.toJson(),
      };
}

class Jurusan {
  Jurusan({
    required this.id,
    required this.jurusan,
  });

  String id;
  String jurusan;

  factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
        id: json["id"],
        jurusan: json["jurusan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jurusan": jurusan,
      };
}

class Wali {
  Wali({
    required this.id,
    required this.nama,
  });

  String id;
  String nama;

  factory Wali.fromJson(Map<String, dynamic> json) => Wali(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
