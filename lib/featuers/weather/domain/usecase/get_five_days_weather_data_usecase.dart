import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/five_days_weather.dart';
import '../reipostery/weather_repositery.dart';

class GetFiveDaysWeatherDataUsecase {
  final WeatherRepositery weatherRepositery;

  GetFiveDaysWeatherDataUsecase({required this.weatherRepositery});

  Future<Either<Failure, FiveDaysWeather>> call({String ?name}) async {
    return await weatherRepositery.getFiveDaysWeatherData(name:name)!;
  }

}