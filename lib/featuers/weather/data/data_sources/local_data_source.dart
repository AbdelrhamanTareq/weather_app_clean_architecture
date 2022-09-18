import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/five_days_weather_data_model.dart';
import '../models/weather_data_model.dart';
import '../../domain/entity/five_days_weather.dart';
import '../../domain/entity/weather_data_entity.dart';

abstract class LocalDataSource {
  Future<WeatherData> getLocalWeatherData();
  Future<void> cacheLocalWeatherData(WeatherData weatherData);
  Future<FiveDaysWeather> getLocalFiveDaysWeatherData();
  Future<void> cacheLocalFiveWeatherData(FiveDaysWeather fiveDaysWeather);
  String? getUserState();
}

class LocalDataSourceImpl extends LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherData> getLocalWeatherData() {
    try {
      final localData =
          sharedPreferences.getString(AppStrings.cachedWeaherData);
      if (localData != null) {
        return Future.value(WeatherDataModel.fromJson(jsonDecode(localData)));
      } else {
        throw CacheException();
      }
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheLocalWeatherData(WeatherData weatherData) async {
    await sharedPreferences.setString(
        AppStrings.cachedWeaherData, jsonEncode(weatherData));
  }

  @override
  Future<void> cacheLocalFiveWeatherData(
      FiveDaysWeather fiveDaysWeather) async {
    await sharedPreferences.setString(
        AppStrings.cachedFiveDaysWeaherData, jsonEncode(fiveDaysWeather));
  }

  @override
  Future<FiveDaysWeather> getLocalFiveDaysWeatherData() {
    try {
      final localFiveDaysData =
          sharedPreferences.getString(AppStrings.cachedFiveDaysWeaherData);
      if (localFiveDaysData != null) {
        return Future.value(
            FiveDaysDataWeatherModel.fromJson(jsonDecode(localFiveDaysData)));
      } else {
        throw CacheException();
      }
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  String? getUserState() {
    return sharedPreferences.getString(AppStrings.state);
  }
}
