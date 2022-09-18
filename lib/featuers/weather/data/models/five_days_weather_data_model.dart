import '../../domain/entity/five_days_weather.dart';

class FiveDaysDataWeatherModel extends FiveDaysWeather {
  FiveDaysDataWeatherModel({
    required String cod,
    required List<WeatherListModel> listModel,
    required CityModel cityModel,
  }) : super(
          cod: cod,
          city: cityModel,
          list: listModel,
        );

  factory FiveDaysDataWeatherModel.fromJson(Map<String, dynamic> json) {
    return FiveDaysDataWeatherModel(
        cod: json['cod'],
        listModel: List.from(json['list'])
            .map((e) => WeatherListModel.fromJson(e))
            .toList(),
        cityModel: CityModel.fromJson(json['city']));
  }


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cod'] = cod;
   
    _data['list'] = list.map((e)=>e).toList();
    _data['city'] = city;
    return _data;
  }


}

class WeatherListModel extends WeatherList {
  WeatherListModel({
    required dynamic dtModel,
    required Main mainModel,
    required List<Weather> weatherModel,
    required Clouds cloudsModel,
    required Wind windModel,
    required String dtTextModel,
  }) : super(
          dt: dtModel,
          main: mainModel,
          weather: weatherModel,
          clouds: cloudsModel,
          wind: windModel,
          dtTxt: dtTextModel,
        );

  factory WeatherListModel.fromJson(Map<String, dynamic> json) {
    return WeatherListModel(
        dtModel: json['dt'],
        mainModel: MainModel.fromJson(json['main']),
        weatherModel: List.from(json['weather'])
            .map((e) => WeatherModel.fromJson(e))
            .toList(),
        cloudsModel: CloudsModel.fromJson(json['clouds']),
        windModel: WindModel.fromJson(json['wind']),
        dtTextModel: json['dt_txt']);
  }

  Map<String, dynamic> toJson() {
    
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['main'] = main;
    _data['weather'] = weather.map((e) => e).toList();
    _data['clouds'] = clouds;
    _data['wind'] = wind;

    _data['dt_txt'] = dtTxt;
    return _data;
  }
  
}

class MainModel extends Main {
  MainModel({
    required dynamic tempModel,
    required dynamic feelsLikeModel,
    required dynamic tempMinModel,
    required dynamic tempMaxModel,
    required dynamic pressureModel,
    required dynamic seaLevelModel,
    required dynamic grndLevelModel,
    required dynamic humidityModel,
    required dynamic tempKfModel,
  }) : super(
          temp: tempModel,
          feelsLike: feelsLikeModel,
          tempMin: tempMinModel,
          tempMax: tempMaxModel,
          pressure: pressureModel,
          seaLevel: seaLevelModel,
          grndLevel: grndLevelModel,
          humidity: humidityModel,
          tempKf: tempKfModel,
        );

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      tempModel: json['temp'],
      feelsLikeModel: json['feels_like'],
      tempMinModel: json['temp_min'],
      tempMaxModel: json['temp_max'],
      pressureModel: json['pressure'],
      seaLevelModel: json['sea_level'],
      grndLevelModel: json['grnd_level'],
      humidityModel: json['humidity'],
      tempKfModel: json['temp_kf'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['temp_min'] = tempMin;
    _data['temp_max'] = tempMax;
    _data['pressure'] = pressure;
    _data['sea_level'] = seaLevel;
    _data['grnd_level'] = grndLevel;
    _data['humidity'] = humidity;
    _data['temp_kf'] = tempKf;
    return _data;
  }
}

class WeatherModel extends Weather {
  WeatherModel({
    required String mainModel,
    required String descriptionModel,
  }) : super(
          main: mainModel,
          description: descriptionModel,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        mainModel: json['main'], descriptionModel: json['description']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['main'] = main;
    _data['description'] = description;

    return _data;
  }
}

class CloudsModel extends Clouds {
  CloudsModel({
    required dynamic allModel,
  }) : super(all: allModel);

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(allModel: json['all']);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
}

class WindModel extends Wind {
  WindModel({
    required dynamic speedModel,
    required dynamic degModel,
    required dynamic gustModel,
  }) : super(speed: speedModel, deg: degModel, gust: gustModel);

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
        speedModel: json['speed'],
        degModel: json['deg'],
        gustModel: json['gust']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    _data['gust'] = gust;
    return _data;
  }
}

class CityModel extends City {
  CityModel({
    required String nameModel,
    required String countryModel,
    required dynamic populationModel,
    required dynamic timezoneModel,
    required dynamic sunriseModel,
    required dynamic sunsetModel,
  }) : super(
          name: nameModel,
          country: countryModel,
          population: populationModel,
          timezone: timezoneModel,
          sunrise: sunriseModel,
          sunset: sunsetModel,
        );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        nameModel: json['name'],
        countryModel: json['country'],
        populationModel: json['population'],
        timezoneModel: json['timezone'],
        sunriseModel: json['sunrise'],
        sunsetModel: json['sunset']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['country'] = country;
    _data['population'] = population;
    _data['timezone'] = timezone;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    return _data;
  }
}
