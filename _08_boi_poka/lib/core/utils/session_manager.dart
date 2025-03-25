import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _lastScreenKey = "/carousel";
  static late SharedPreferences? _prefs;

  // Initialize SharedPreferences once
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //? Save the last visited screen
  static Future<void> saveLastScreen(String routeName) async {
    if (_prefs == null) await init();
    await _prefs!.setString(_lastScreenKey, routeName);
  }

  //? Get the last visited screen
  static Future<String?> getLastScreen() async {
    // if (_prefs == null) await init();
    return _prefs!.getString(_lastScreenKey) ?? "/home";
  }

  //? Clear the last visited screen (if needed)
  static Future<void> clearSession() async {
    if (_prefs == null) await init();
    await _prefs!.remove(_lastScreenKey);
  }
}
