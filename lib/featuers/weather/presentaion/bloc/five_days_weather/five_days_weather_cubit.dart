import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../../../../core/utils/component.dart';
import '../../../domain/usecase/get_five_days_weather_data_usecase.dart';
import 'five_days_weahter_states.dart';

class FiveDaysWeatherCubit extends Cubit<FiveDaysWeatherStates> {
  final GetFiveDaysWeatherDataUsecase fiveDaysWeatherDataUsecase;

  FiveDaysWeatherCubit({required this.fiveDaysWeatherDataUsecase})
      : super(LoadingFiveDaysWaehterState());

  void getFiveDaysWeatherData({String? name}) async {
    emit(LoadingFiveDaysWaehterState());

    final failureOrWeather = await fiveDaysWeatherDataUsecase.call(name: name);

    failureOrWeather.fold((failure) {
      emit(ErrorFiveDaysWeatherState(message: handleErrors(failure)));
    }, (weather) {
      //fiveDaysWeather = weather;
      log(weather.city.name);
      emit(LoadedFiveDaysWeatherState(weather: weather));
    });
  }

  
}
