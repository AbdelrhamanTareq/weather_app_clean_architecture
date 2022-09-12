import 'dart:convert';

import 'package:weather_app/core/api/dio_consumer.dart';
import 'package:weather_app/core/api/end_point.dart';
import 'package:weather_app/core/errors/exception.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/featuers/weather/data/models/five_days_weather_data_model.dart';
import 'package:weather_app/featuers/weather/data/models/weather_data_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherDataModel> getWeatherData({String? name});
  Future<FiveDaysDataWeatherModel> getFiveDaysWeatherData({String? name});
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final DioConsumer dioConsumer;

  WeatherRemoteDataSourceImpl({required this.dioConsumer});
  @override
  Future<WeatherDataModel> getWeatherData({String? name}) async {
    try {
      final response = await dioConsumer.get(WEATHER,queryParameters: {"q": name ?? "cairo", });
      //final response = await dio.get(
          //'https://api.openweathermap.org/data/2.5/weather?q=${name ?? "cairo"}&appid=2018d10f05cdeb795f12b3bd4d1d18ea&units=metric');
      final data = WeatherDataModel.fromJson(jsonDecode(response.data));
      return data;
    } on ServerException {
      throw ServerFailute();
    }
  }

  @override
  Future<FiveDaysDataWeatherModel> getFiveDaysWeatherData(
      {String? name}) async {
    try {
      final response = await dioConsumer.get(FIVE_DAYS_WEATHER,queryParameters: {"q" : name ?? "cairo",});
      //final response = await dio.get(
          //'https://api.openweathermap.org/data/2.5/forecast?q=${name ?? "cairo"}&appid=2018d10f05cdeb795f12b3bd4d1d18ea&units=metric');
      final data = FiveDaysDataWeatherModel.fromJson(jsonDecode(response.data));
      return data;
    } on ServerException {
      throw ServerFailute();
    }
  }

 
}
