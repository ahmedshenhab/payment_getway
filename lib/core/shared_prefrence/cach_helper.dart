import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  CachHelper._privateConstructor();
  // dont matter and dont important if using static and call directly from class

  // static final CachHelper instance = CachHelper._privateConstructor();

  static SharedPreferences? _pref;

  static Future<void> init() async {
    _pref ??= await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    switch (value) {
      case bool _:
        return _pref!.setBool(key, value);

      case String _:
        return _pref!.setString(key, value);
      case int _:
        return _pref!.setInt(key, value);

      case double _:
        return _pref!.setDouble(key, value);

      default:
        throw ArgumentError('unsupported value type');
    }
  }

  static dynamic getData({required String key}) {
    return _pref!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await _pref!.remove(key);
  }
}
