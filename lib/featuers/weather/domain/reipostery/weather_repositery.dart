import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/featuers/weather/domain/entity/five_days_weather.dart';
import 'package:weather_app/featuers/weather/domain/entity/weather_data_entity.dart';

abstract class WeatherRepositery extends Equatable{
  Future<Either<Failure,WeatherData>>? getWeatherData({String? name});

  Future<Either<Failure,FiveDaysWeather>>? getFiveDaysWeatherData({String? name});

  String? getUserState();

  
}