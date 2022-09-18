import 'package:equatable/equatable.dart';
import '../../../domain/entity/five_days_weather.dart';

abstract class FiveDaysWeatherStates extends Equatable {
  const FiveDaysWeatherStates();
  @override
  List<Object> get props => [];
}



class LoadingFiveDaysWaehterState extends FiveDaysWeatherStates {
 
}

class LoadedFiveDaysWeatherState extends FiveDaysWeatherStates {
  final FiveDaysWeather weather;

  const LoadedFiveDaysWeatherState({required this.weather});

  @override
  List<Object> get props => [weather];
}

class ErrorFiveDaysWeatherState extends FiveDaysWeatherStates {
  final String message;

  const ErrorFiveDaysWeatherState({required this.message});

  @override
  List<Object> get props => [message];
}
