// Package imports:
import 'package:pet_adoption_app/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> getSP() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref;
  }

  static saveTheme({required bool isDark}) async {
    SharedPreferences pref = await getSP();
    pref.setBool(mythemekey, isDark);
  }

  static Future<bool?> getTheme() async {
    SharedPreferences pref = await getSP();
    var result = pref.getBool(mythemekey) ?? false;
    SharedPreferencesService.saveTheme(isDark: result);
    return result;
  }

  static makeItInitial() async {
    SharedPreferences pref = await getSP();
    pref.clear();
  }
}
