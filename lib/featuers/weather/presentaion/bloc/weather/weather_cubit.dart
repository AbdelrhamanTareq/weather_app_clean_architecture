import 'package:bloc/bloc.dart';
import 'package:weather_app/core/utils/component.dart';

import 'package:weather_app/featuers/weather/domain/usecase/get_weather_data_usecase.dart';
import 'package:weather_app/featuers/weather/presentaion/bloc/weather/weather_states.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final GetWeatherDataUsecase weatherDataUsecase;
  //final List<FiveDaysWeather> fiveDaysWeather = [];

  WeatherCubit({
    required this.weatherDataUsecase,
  }) : super(LoadingWaehterState());

  void getWeatherData({String? name}) async {
    emit(LoadingWaehterState());

    final failureOrWeather = await weatherDataUsecase.call(name: name);

    failureOrWeather.fold((failure) {
      //emit(LoadingWaehterState());
      emit(ErrorWeatherState(message: handleErrors(failure)));
    }, (weather) {
      emit(LoadedWeatherState(weather: weather));
    });
    //failureOrWeather.fold(
    //(failure) => emit(ErrorWeatherState(message: _handleErrors(failure))),
    //(weather) {
    //emit(LoadedWeatherState(weather: weather));
    //});
  }
}
