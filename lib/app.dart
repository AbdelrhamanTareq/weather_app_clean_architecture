import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/component.dart';
import 'core/utils/app_strings.dart';
import 'featuers/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'featuers/onboarding/presentation/screens/onboarding_screen.dart';
import 'featuers/weather/presentaion/bloc/five_days_weather/five_days_weather_cubit.dart';
import 'featuers/weather/presentaion/screens/weather_screen.dart';

import 'featuers/weather/presentaion/bloc/weather/weather_cubit.dart';
import 'injection_container.dart' as di;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  final bool onboardingToken = onBoardingToken();
  //final String userState = getUserState();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => di.sl<WeatherCubit>(),
        ),
        BlocProvider<FiveDaysWeatherCubit>(
          create: (context) => di.sl<FiveDaysWeatherCubit>(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) => di.sl<OnboardingCubit>(),
        ),
      ],
      child: MaterialApp(
          title: 'Al-Taqs',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: AppStrings.fontName,
            primarySwatch: Colors.blue,
          ),
          home: (onboardingToken != false)
              ? const WeatherScreen()
              : const OnboardingScreen()),
    );
  }
}
