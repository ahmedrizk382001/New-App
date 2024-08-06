import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setMode(String key, bool mode) async {
    await prefs.setBool(key, mode);
  }

  static bool? getMode(String key) {
    return prefs.getBool(key);
  }
}
