/*
class FiveDaysWeather {

  late final String cod;
  late final List<List> list;
  late final City city;

  FiveDaysWeather({
    required this.cod,
    required this.list,
    required this.city,
  });
  

  /*FiveDaysWeather.fromJson(Map<String, dynamic> json){
    cod = json['cod'];
    
    list = List.from(json['list']).map((e)=>List.fromJson(e)).toList();
    city = City.fromJson(json['city']);
  }
  

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cod'] = cod;
    _data['message'] = message;
    _data['cnt'] = cnt;
    _data['list'] = list.map((e)=>e.toJson()).toList();
    _data['city'] = city.toJson();
    return _data;
  }

  */

}

class List {
  List({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.dtTxt,
  });

  late final int dt;
  late final Main main;
  late final List<Weather> weather;
  late final Clouds clouds;
  late final Wind wind;

  late final String dtTxt;

  /*
  List.fromJson(Map<String, dynamic> json){
    dt = json['dt'];
    main = Main.fromJson(json['main']);
    weather = List.from(json['weather']).map((e)=>Weather.fromJson(e)).toList();
    clouds = Clouds.fromJson(json['clouds']);
    wind = Wind.fromJson(json['wind']);
    
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['main'] = main.toJson();
    _data['weather'] = weather.map((e)=>e.toJson()).toList();
    _data['clouds'] = clouds.toJson();
    _data['wind'] = wind.toJson();
    
    _data['dt_txt'] = dtTxt;
    return _data;
  }
  */
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
  late final double temp;
  late final double feelsLike;
  late final double tempMin;
  late final double tempMax;
  late final int pressure;
  late final int seaLevel;
  late final int grndLevel;
  late final int humidity;
  late final double? tempKf;

/*
  Main.fromJson(Map<String, dynamic> json){
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
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
  */
}

class Weather {
  Weather({
    required this.main,
    required this.description,
  });

  late final String main;
  late final String description;

  /*
  Weather.fromJson(Map<String, dynamic> json){
    
    main = json['main'];
    description = json['description'];
    
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    
    _data['main'] = main;
    _data['description'] = description;
    
    return _data;
  }
  */
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final int all;

  /*
  Clouds.fromJson(Map<String, dynamic> json){
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
  */

}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
  late final double? speed;
  late final int deg;
  late final double gust;

  /*
  Wind.fromJson(Map<String, dynamic> json){
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    _data['gust'] = gust;
    return _data;
  }
  */

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
  late final int population;
  late final int timezone;
  late final int sunrise;
  late final int sunset;

/*

  City.fromJson(Map<String, dynamic> json){
    name = json['name'];
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
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
  */

}
*/