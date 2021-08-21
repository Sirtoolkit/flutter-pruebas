part of 'services.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences?> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  //sets
  static Future<void> saveValue<T>(String key, T value) async {
    switch (value.runtimeType) {
      case String:
        await _prefs.setString(key, value as String);
        break;
      case bool:
        await _prefs.setBool(key, value as bool);
        break;
      case int:
        await _prefs.setInt(key, value as int);
        break;
      default:
    }
  }

  static String? getValue(key) => _prefs.getString(key);

  //deletes..
  static Future<bool> remove(String key) async => await _prefs.remove(key);

  static Future<bool> clear() async => await _prefs.clear();
}
