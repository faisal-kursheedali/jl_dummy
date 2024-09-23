import 'package:shared_preferences/shared_preferences.dart';

class PrefUtil {
  static late final SharedPreferences preferences;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    return preferences;
  }

  static setValue(String key, Object value) {
    switch (value.runtimeType) {
      case String:
        preferences.setString(key, value as String);
        break;
      case bool:
        preferences.setBool(key, value as bool);
        break;
      case int:
        preferences.setInt(key, value as int);
        break;
      default:
    }
  }

  static Object getValue(String key, Object defaultValue) {
    switch (defaultValue.runtimeType) {
      case String:
        return preferences.getString(key) ?? "";
      case bool:
        return preferences.getBool(key) ?? false;
      case int:
        return preferences.getInt(key) ?? 0;
      default:
        return defaultValue;
    }
  }

  static String getString(String key) {
    return preferences.getString(key) ?? "";
  }

  static bool getBool(String key) {
    return preferences.getBool(key)!;
  }

  static Future<bool> setString(String key, String value) async {
    return await preferences.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await preferences.setBool(key, value);
  }

  static Future<bool> remove(String key) async {
    return await preferences.remove(key);
  }
}

class Config {
  // static String BASE_URL = "https://zabackend.onrender.com/api";
  static String BASE_URL = "https://joblisting.zatest.biz/api";

  static Future<Map<String, String>> getHeaderWithoutToken() async {
    return {'Content-Type': 'application/json'};
  }
}

class EndPoints {
  static String LOGIN = "${Config.BASE_URL}/auth/login";
  static String REGISTER = "${Config.BASE_URL}/auth/register";
  static String RESETPASSWORD = "${Config.BASE_URL}/auth/password-reset";
  static String PROFILE = "${Config.BASE_URL}/auth/profile";
  static String GetAlertSetting =
      "${Config.BASE_URL}/auth/users/preferences/alert";
  static String UpdateAlertSetting =
      "${Config.BASE_URL}/auth/users/preferences/alert";
  static String UpdateNetworkSetting =
      "${Config.BASE_URL}/auth/users/preferences/network";
  static String GetNetworkSetting =
      "${Config.BASE_URL}/auth/users/preferences/network";
  static String OnboardNewUser = "${Config.BASE_URL}/auth/onboard";
  static String EditUser = "${Config.BASE_URL}/auth/edit-profile";
  static String JOBS = "${Config.BASE_URL}/jobs";
}
