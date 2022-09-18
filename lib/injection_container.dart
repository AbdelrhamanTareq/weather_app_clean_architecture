import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/dio_consumer.dart';
import 'core/api/dio_intercepoters.dart';
import 'core/helpers/cache_helper.dart';
import 'core/network/network_info.dart';
import 'featuers/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'featuers/onboarding/data/repositrey/onboarding_repositrey_impl.dart';
import 'featuers/onboarding/domain/repositrey/onboarding_repositrey.dart';
import 'featuers/onboarding/domain/usecases/get_onboarding_finished_token_usecase.dart';
import 'featuers/onboarding/domain/usecases/set_state_usecase.dart';
import 'featuers/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'featuers/weather/data/data_sources/local_data_source.dart';
import 'featuers/weather/data/data_sources/remote_data_sorce.dart';
import 'featuers/weather/data/repositrey/weather_data_impl.dart';
import 'featuers/weather/domain/reipostery/weather_repositery.dart';
import 'featuers/weather/domain/usecase/get_five_days_weather_data_usecase.dart';
import 'featuers/weather/domain/usecase/get_user_state_usecase.dart';
import 'featuers/weather/domain/usecase/get_weather_data_usecase.dart';
import 'featuers/weather/presentaion/bloc/five_days_weather/five_days_weather_cubit.dart';
import 'featuers/weather/presentaion/bloc/weather/weather_cubit.dart';

import 'featuers/onboarding/domain/usecases/set_onboarding_finished_token_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => WeatherCubit(
        weatherDataUsecase: sl(),
      ));

  sl.registerFactory(
      () => FiveDaysWeatherCubit(fiveDaysWeatherDataUsecase: sl()));

  sl.registerFactory(() => OnboardingCubit(
        getOnbardingFinishedTokenUsecase: sl(),
        setOnbardingFinishedTokenUsecase: sl(),
        setStateUsecase: sl(),
      ));

  // usecases

  sl.registerLazySingleton(
      () => GetWeatherDataUsecase(weatherRepositery: sl()));
  sl.registerLazySingleton(
      () => GetFiveDaysWeatherDataUsecase(weatherRepositery: sl()));

  sl.registerLazySingleton(() => GetUserStateUsecase(weatherRepositery: sl()));

  sl.registerLazySingleton(
      () => GetOnbardingFinishedTokenUsecase(onBoardingRepositrey: sl()));
  sl.registerLazySingleton(
      () => SetOnbardingFinishedTokenUsecase(onBoardingRepositrey: sl()));
  sl.registerLazySingleton(() => SetStateUsecase(onboardingRepositrey: sl()));

  // repositery

  sl.registerLazySingleton<WeatherRepositery>(() => WeatherDataImpl(
        weatherRemoteDataSource: sl(),
        networkInfo: sl(),
        localDataSource: sl(),
      ));

  sl.registerLazySingleton<OnboardingRepositrey>(
      () => OnBoardingRepositreyImpl(onboardingLocalDataSource: sl()));

  // data sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(dioConsumer: sl()));

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSourceImpl(sharedPreferences: sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  sl.registerLazySingleton(() => DioConsumer(dio: sl()));
  // helper

  sl.registerLazySingleton<CacheHelper>(
      () => CacheHelperImpl(sharedPreferences: sl()));

  // external
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioInterceptors());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  final SharedPreferences _sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => _sharedPreferences);
}
