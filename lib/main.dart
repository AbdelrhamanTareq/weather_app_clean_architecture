import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/bloc_observer.dart';

import 'injection_container.dart' as di;

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
