import 'package:equatable/equatable.dart';

class FiveDaysWeather extends Equatable {
  late final String cod;
  late final List<WeatherList> list;
  late final City city;

  FiveDaysWeather({
    required this.cod,
    required this.list,
    required this.city,
  });

  @override
  List<Object?> get props => [cod, list, city];
}

class WeatherList {
  WeatherList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.dtTxt,
  });

  late final dynamic dt;
  late final Main main;
  late final List<Weather> weather;
  late final Clouds clouds;
  late final Wind wind;

  late final String dtTxt;
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });
  late final dynamic temp;
  late final dynamic feelsLike;
  late final dynamic tempMin;
  late final dynamic tempMax;
  late final dynamic pressure;
  late final dynamic seaLevel;
  late final dynamic grndLevel;
  late final dynamic humidity;
  late final dynamic tempKf;
}

class Weather {
  Weather({
    required this.main,
    required this.description,
  });

  late final String main;
  late final String description;
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final dynamic all;
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
  late final dynamic speed;
  late final dynamic deg;
  late final dynamic gust;
}

class City {
  City({
    required this.name,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });
  late final String name;
  late final String country;
  late final dynamic population;
  late final dynamic timezone;
  late final dynamic sunrise;
  late final dynamic sunset;
}
