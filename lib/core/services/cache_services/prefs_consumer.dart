import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../../errors/cache_exceptions.dart';
import 'cache_services.dart';

class PrefsConsumer extends CacheServices {
  final SharedPreferences _sharedPreferences;

  PrefsConsumer(this._sharedPreferences);

  @override
  Future<void> saveData({
    String? boxName,
    required String key,
    required dynamic value,
  }) async {
    try {
      if (value is String) {
        await _sharedPreferences.setString(key, value);
      } else if (value is int) {
        await _sharedPreferences.setInt(key, value);
      } else if (value is bool) {
        await _sharedPreferences.setBool(key, value);
      } else if (value is double) {
        await _sharedPreferences.setDouble(key, value);
      } else if (value is List<String>) {
        await _sharedPreferences.setStringList(key, value);
      } else {
        log('Unknown value type');
        throw CacheExceptions('Unknown value type');
      }
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(
        'Error while saving data to shared preferences : $e',
      );
    }
  }

  @override
  dynamic getData({required String key}) {
    try {
      if (!_sharedPreferences.containsKey(key)) {
        log('Key not found');
        print('jey is $key');
        print(_sharedPreferences.getKeys());
        return null;
      }
      return _sharedPreferences.get(key);
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(
        'Error while getting data from shared preferences : $e',
      );
    }
  }

  @override
  Future<void> removeData({required String key}) async {
    try {
      await _sharedPreferences.remove(key);
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(
        'Error while removing data from shared preferences : $e',
      );
    }
  }

  @override
  Future<void> clearData() async {
    try {
      await _sharedPreferences.clear();
    } catch (e) {
      log(e.toString());
      throw CacheExceptions(
        'Error while clearing data from shared preferences : $e',
      );
    }
  }
}
