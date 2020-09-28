import 'package:shared_preferences/shared_preferences.dart';
import 'package:treeco/core/constants/enums/locale_keys_enum.dart';

class LocaleManager {
  static LocaleManager _instance = LocaleManager._init();

  SharedPreferences _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static prefrencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences.setString(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) =>
      _preferences.getString(key.toString()) ?? "";

  Future<void> setIntValue(PreferencesKeys key, int value) async {
    await _preferences.setInt(key.toString(), value);
  }

  int getIntValue(PreferencesKeys key) =>
      _preferences.getInt(key.toString()) ?? 0;
}
