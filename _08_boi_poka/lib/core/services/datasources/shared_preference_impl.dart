import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  Future<void> deleteData(String key) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.remove(key);
  }

  Future<String?> getData(String key) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(key);
  }

  Future<void> storeData(String key, String value) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setString(key, value);
  }

  Future<void> storeBool(String key, bool value) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getBool(key) ?? false;
  }

  Future<void> deleteAll() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.clear();
    return;
  }
}
