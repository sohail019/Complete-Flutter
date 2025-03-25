import "dart:developer";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class SecureStorage {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<String?> getSecureData({required String key}) async {
    return await secureStorage.read(key: key);
  }

  Future<void> saveSecureData({
    required String key,
    required String value,
  }) async {
    log("Storing Data");
    await secureStorage.write(key: key, value: value);
  }

  Future<void> removeSecureData({required String key}) async {
    await secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await secureStorage.deleteAll();
  }
}
