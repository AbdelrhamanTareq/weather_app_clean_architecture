import '../../../../core/errors/exception.dart';
import '../../../../core/network/network_info.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_sorce.dart';
import '../../domain/entity/five_days_weather.dart';
import '../../domain/entity/weather_data_entity.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/reipostery/weather_repositery.dart';

class WeatherDataImpl extends WeatherRepositery {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;

  WeatherDataImpl(
      {required this.weatherRemoteDataSource,
      required this.networkInfo,
      required this.localDataSource});

  @override
  List<Object?> get props => [];

  @override
  Future<Either<Failure, WeatherData>>? getWeatherData({String? name}) async {
    if (await networkInfo.isDviceConeccted) {
      try {
        final weatherData =
            await weatherRemoteDataSource.getWeatherData(name: name);
        localDataSource.cacheLocalWeatherData(weatherData);
        return Right(weatherData);
      } on ServerException {
        return Left(ServerFailute());
      }
    } else {
      try {
        final localWeaherData = await localDataSource.getLocalWeatherData();
        return Right(localWeaherData);
      } catch (e) {
        return Left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, FiveDaysWeather>>? getFiveDaysWeatherData(
      {String? name}) async {
    if (await networkInfo.isDviceConeccted) {
      try {
        final weatherData =
            await weatherRemoteDataSource.getFiveDaysWeatherData(name: name);
        localDataSource.cacheLocalFiveWeatherData(weatherData);
        return Right(weatherData);
      } on ServerException {
        return Left(ServerFailute());
      }
    } else {
      try {
        final localFiveDaysData =
            await localDataSource.getLocalFiveDaysWeatherData();
        return Right(localFiveDaysData);
      } catch (e) {
        return Left(OfflineFailure());
      }
    }
  }

  @override
  String? getUserState() {
    return localDataSource.getUserState();
  }
}
