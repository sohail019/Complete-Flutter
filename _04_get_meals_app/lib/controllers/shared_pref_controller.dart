import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  // void storeListData(String key, List<String> data) async {
  //   final sharedPref = await SharedPreferences.getInstance();
  //   await sharedPref.setStringList(key, data);
  //   log("Data Stored Succssefully");
  // }

  void storeStringData(String key, String data) async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString(key, data);
    log("Data Stored Succssefully");
  }

  Future<List<String>?> getListData(String key) async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getStringList(key);
  }
}
