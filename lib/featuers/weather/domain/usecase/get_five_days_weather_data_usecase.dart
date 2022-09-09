import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/featuers/weather/domain/entity/five_days_weather.dart';
import 'package:weather_app/featuers/weather/domain/reipostery/weather_repositery.dart';

class GetFiveDaysWeatherDataUsecase {
  final WeatherRepositery weatherRepositery;

  GetFiveDaysWeatherDataUsecase({required this.weatherRepositery});

  Future<Either<Failure, FiveDaysWeather>> call({String ?name}) async {
    return await weatherRepositery.getFiveDaysWeatherData(name:name)!;
  }

}