import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:laraseksy_bloc/secureStorage/secureStorage.dart';
import 'package:path_provider/path_provider.dart';

class HiveSecure {
  // if key not exists return null
  static Future<Box<dynamic>> openBox({required String key}) async {
    final encryptionKey = await SecureStorage.init.read(key: 'key');

    if (encryptionKey == null) {
      final key = Hive.generateSecureKey();
      final decryptionKey =
          SecureStorage.init.write(key: 'key', value: base64UrlEncode(key));
    }
    final key = await SecureStorage.init.read(key: 'key');
    final encrypt = base64Url.decode(key!);
    print('Encryption key: $encrypt');
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    return Hive.openBox(key,
        encryptionCipher: HiveAesCipher(encrypt),
        path: appDocumentDirectory.path);
    // encryptedBox.put(key, value);
    // print(encryptedBox.get('secret'));
  }
}
