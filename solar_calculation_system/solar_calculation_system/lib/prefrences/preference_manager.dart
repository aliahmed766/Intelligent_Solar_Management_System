import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static const PREF_IS_USER_LOGGED_IN = "PREF_IS_USER_LOGGED_IN";
  static const PREF_IS_FIRST_SPLASH = "PREF_IS_FIRST_SPLASH";
  static const PREF_USER_EMAIL = "PREF_USER_NAME";
  static const PREF_USER_PASSWORD = "PREF_USER_PASSWORD";

  static Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await getPreferences();
    return sharedPreferences.getBool(PREF_IS_USER_LOGGED_IN) ?? false;
  }

  static Future<bool> isFirstSplash() async {
    SharedPreferences sharedPreferences = await getPreferences();
    return sharedPreferences.getBool(PREF_IS_FIRST_SPLASH) ?? true;
  }

  static Future<String> getUserEmail() async {
    SharedPreferences sharedPreferences = await getPreferences();
    return sharedPreferences.getString(PREF_USER_EMAIL) ?? "";
  }

  static Future<String> getUserPassword() async {
    SharedPreferences sharedPreferences = await getPreferences();
    return sharedPreferences.getString(PREF_USER_PASSWORD) ?? "";
  }
  static Future<void> setUserPassword(String password) async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.setString(PREF_USER_PASSWORD, password);
  }
  static Future<void> setUserName(String email) async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.setString(PREF_USER_EMAIL, email);
  }
  static Future<void> setUserLoggedIn() async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.setBool(PREF_IS_USER_LOGGED_IN,true);
  }
  static Future<void> setIsFirstLaunch() async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.setBool(PREF_IS_FIRST_SPLASH,false);
  }
  static Future<void> logout() async {
    SharedPreferences sharedPreferences = await getPreferences();
    sharedPreferences.clear();
  }
}
