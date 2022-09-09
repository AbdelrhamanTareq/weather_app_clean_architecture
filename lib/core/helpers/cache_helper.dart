import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  String? getString(String key);
  bool? getBool(String key);
}

class CacheHelperImpl implements CacheHelper {
  final SharedPreferences sharedPreferences;

  CacheHelperImpl({required this.sharedPreferences});

  @override
  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  @override
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }
}
