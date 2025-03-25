import "package:_08_boi_poka/core/services/datasources/secure_storage_impl.dart";

class SecureStorageController {
  final SecureStorage secureStorage = SecureStorage();

  Future<void> storeSecureData({
    required String key,
    required String value,
  }) async {
    secureStorage.saveSecureData(key: key, value: value);
  }

  Future<String?> getSecureData({required String key}) async {
    return await secureStorage.getSecureData(key: key);
  }

  Future<void> deleteSecureData({required String key}) async {
    return await secureStorage.removeSecureData(key: key);
  }

  Future<void> deleteAll() async {
    return await secureStorage.deleteAll();
  }
}
