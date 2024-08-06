
import 'package:demo_project/utils/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesInitialize {
  static SharedPreferences? _sharePreferences;

  static get preference => _sharePreferences;

  static initialize() async {
    _sharePreferences = await SharedPreferences.getInstance();
    return _sharePreferences;
  }

  // SET PREF VALUE -->
  static setStringPrefValue({required String key, required String value}) =>
      _sharePreferences?.setString(key, value);

  static setBoolPrefValue({required String key, required bool value}) =>
      _sharePreferences?.setBool(key, value);

  // GET PREF VALUE -->
  static String getStringPrefValue({required String key}) =>
      _sharePreferences?.getString(key) ?? StringConstants.empty;

  static bool? getBoolPrefValue({required String key}) =>
      _sharePreferences?.getBool(key) ?? isFalse;
}
