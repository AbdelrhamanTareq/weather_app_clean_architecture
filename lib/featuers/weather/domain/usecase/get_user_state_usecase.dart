import 'package:weather_app/featuers/weather/domain/reipostery/weather_repositery.dart';

class GetUserStateUsecase {
  final WeatherRepositery weatherRepositery;

  GetUserStateUsecase({required this.weatherRepositery});

  String? getUserState() {
    return weatherRepositery.getUserState();
  }
}
