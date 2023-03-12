import 'package:hive/hive.dart';
import 'package:laraseksy_bloc/secureStorage/hiveSecure.dart';
import 'package:laraseksy_bloc/secureStorage/keyStorage.dart';

class getIdSiswa {
  static getId() async {
    Box<dynamic> encrypt = await HiveSecure.openBox(key: BoxKey.siswa);
    var data = encrypt.get(BoxKey.siswa);
    return await data?[KeyStorage.siswaId];
  }
}
