import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _kSharedPreferencesThemeState = 'lightTheme';

  static bool isLightTheme = true;

  static saveThemeState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kSharedPreferencesThemeState, value);
    print('Saved $value');
  }

  static Future<bool> getThemeState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kSharedPreferencesThemeState) ?? true;
  }
}
