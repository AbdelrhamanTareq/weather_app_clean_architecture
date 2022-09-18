import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/weather_data_entity.dart';
import '../reipostery/weather_repositery.dart';

class GetWeatherDataUsecase {
  final WeatherRepositery weatherRepositery;

  GetWeatherDataUsecase({required this.weatherRepositery});

  Future<Either<Failure, WeatherData>> call({String ?name}) async {
    return await weatherRepositery.getWeatherData(name:name)!;
  }
}
