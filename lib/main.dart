import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/core/bloc_observer.dart';

import 'package:weather_app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  BlocOverrides.runZoned(
    () {
      runApp( MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
