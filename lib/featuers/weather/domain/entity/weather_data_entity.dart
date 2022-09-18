// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeatherData extends Equatable {
  late final List<Weather> weather;
  late final Main main;
  late final Wind wind;
  late final Clouds clouds;
  late final Sys sys;
  late final String name;
  late final int  dt;
  WeatherData({
    required this.weather,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.sys,
    required this.name,
    required this.dt,
  });

  @override
  List<Object?> get props => [weather, main, wind, clouds, name];
}

class Weather {
  late final String main;
  late final String description;
  late final String icon;
  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });
}

class Main {
  late final dynamic temp;
  late final dynamic feelsLike;
  late final dynamic tempMin;
  late final dynamic tempMax;
  late final int pressure;
  late final int humidity;
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
}

class Sys {
  late final String country;
  late final int sunrise;
  late final int sunset;
  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}

class Clouds {
  late final int all;
  Clouds({
    required this.all,
  });
}

class Wind {
  late final double speed;
  late final int deg;
  Wind({
    required this.speed,
    required this.deg,
  });
}
