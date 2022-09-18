import '../../domain/entity/weather_data_entity.dart';

class WeatherDataModel extends WeatherData {
  WeatherDataModel(
      {required String name,
      required List<WeatherModel> weatherModel,
      required MainModel mainModel,
      required CloudsModel cloudsModel,
      required WindModel windModel,
      required int dtModel,
      required SysModel sysModel
      })
      : super(
          name: name,
          weather: weatherModel,
          main: mainModel,
          clouds: cloudsModel,
          wind: windModel,
          dt: dtModel,
          sys: sysModel,
        );

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      name: json['name'],
      dtModel: json['dt'],
      weatherModel: List.from(json['weather'])
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      mainModel: MainModel.fromJson(json['main']),
      cloudsModel: CloudsModel.fromJson(json['clouds']),
      windModel: WindModel.fromJson(json['wind']),
      sysModel: SysModel.fromJson(json["sys"])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weather': weather,
      'main': main,
      'clouds': clouds,
      'wind': wind,
      'dt': dt,
      "sys":sys,
    };
  }
}

class WeatherModel extends Weather {
  WeatherModel({
    required String main,
    required String description,
    required String icon,
  }) : super(
          main: main,
          description: description,
          icon: icon,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }

  Map<String, dynamic> toJson() {
    return {'main': main, 'description': description, 'icon': icon};
  }
}

class SysModel extends Sys {
  SysModel({required String country, required int sunrise, required int sunset})
      : super(country: country, sunrise: sunrise, sunset: sunset);

  factory SysModel.fromJson(Map<String, dynamic> json) {
    return SysModel(
        country: json["country"],
        sunrise: json["sunrise"],
        sunset: json["sunset"]);
  }

  Map<String, dynamic> toJson() {
    return {'country': country, "sunrise": sunrise, "sunset": sunset};
  }
}

class MainModel extends Main {
  MainModel(
      {required dynamic temp,
      required dynamic feelsLike,
      required dynamic tempMin,
      required dynamic tempMax,
      required int pressure,
      required int humidity})
      : super(
          humidity: humidity,
          pressure: pressure,
          temp: temp,
          tempMax: tempMax,
          tempMin: tempMin,
          feelsLike: feelsLike,
        );
  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json['temp'] ?? 0.0,
      feelsLike: json['feels_like'] ?? 0.0,
      tempMax: json['temp_max'] ?? 0.0,
      tempMin: json['temp_min'] ?? 0.0,
      pressure: json['pressure'] ?? 0.0,
      humidity: json['humidity'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMax': tempMax,
      'tempMin': tempMin,
      'pressure': pressure,
      'humidity': humidity,
    };
  }
}

class CloudsModel extends Clouds {
  CloudsModel({required int all})
      : super(
          all: all,
        );

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(all: json['all']);
  }

  Map<String, dynamic> toJson() {
    return {
      'all': all,
    };
  }
}

class WindModel extends Wind {
  WindModel({required double speed, required int deg})
      : super(
          speed: speed,
          deg: deg,
        );
  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(speed: json['speed'], deg: json['deg']);
  }

  Map<String, dynamic> toJson() {
    return {'speed': speed, 'deg': deg};
  }
}
