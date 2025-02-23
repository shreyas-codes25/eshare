import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static Future<void> saveToPrefs(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception("Unsupported type for SharedPreferences");
    }
  }

  Future<String?> getPreference(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (await existsInPrefs(key)) {
      return prefs.getString(key);
    }
    return null; // Return null if the type is unsupported
  }

  static Future<bool> existsInPrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<void> clearSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
