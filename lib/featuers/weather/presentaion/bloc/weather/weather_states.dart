import 'package:equatable/equatable.dart';
import 'package:weather_app/featuers/weather/domain/entity/weather_data_entity.dart';

abstract class WeatherStates  extends Equatable{
  const WeatherStates();

  
}



class LoadingWaehterState extends WeatherStates {
  @override
  List<Object?> get props => [];
  
}

class LoadedWeatherState extends WeatherStates {
  final WeatherData weather;

  const LoadedWeatherState({required this.weather});

  @override
  List<Object?> get props => [weather];

  
}

 class ErrorWeatherState extends WeatherStates {
  final String message;

  const ErrorWeatherState({required this.message});

  @override
  List<Object?> get props => [message];

  
}
