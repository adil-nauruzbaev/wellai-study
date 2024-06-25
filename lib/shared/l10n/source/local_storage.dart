import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._(this._prefs);

  late final SharedPreferences _prefs;

  static Future<LocalStorage> get instance async {
    final prefs = await SharedPreferences.getInstance();
    return LocalStorage._(prefs);
  }

  Future<bool> delete(String key) {
    return _prefs.remove(key);
  }

  Object? read(String key) {
    return _prefs.get(key);
  }

  ///Value must be one of the following types:<br>
  ///`bool`, `int`, `double`, `String,` `List<String>`
  ///
  ///Throws otherwise
  Future<bool> write(String key, Object value) {
    return switch (value) {
      (final bool v) => _prefs.setBool(key, v),
      (final int v) => _prefs.setInt(key, v),
      (final double v) => _prefs.setDouble(key, v),
      (final String v) => _prefs.setString(key, v),
      (final List<String> v) => _prefs.setStringList(key, v),
      _ => throw 'Unsupported variable type for local staorage',
    };
  }
}
