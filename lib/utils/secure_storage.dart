import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> addNewKeyInStorage(key, value) async {
    await _storage.delete(key: 'token');
    await _storage.write(
      key: key,
      value: value,
    );
  }

  static Future<String?> getKeyByName(key) async {
    final String? value;
    value =  await _storage.read(key: key);
    return value;
  }

  static Future<void> deleteKeyByName(key) async {
    await _storage.delete(key: key);
  }
}
