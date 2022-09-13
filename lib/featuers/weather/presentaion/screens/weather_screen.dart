import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/utils/component.dart';
import 'package:weather_app/core/widgets/drawer.dart' as app_drawer;
import 'package:weather_app/core/widgets/error_widget.dart' as error_widget;
import 'package:weather_app/featuers/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:weather_app/featuers/weather/domain/entity/five_days_weather.dart';
import 'package:weather_app/featuers/weather/presentaion/bloc/five_days_weather/five_days_weahter_states.dart';
import 'package:weather_app/featuers/weather/presentaion/bloc/five_days_weather/five_days_weather_cubit.dart';

import 'package:weather_app/featuers/weather/presentaion/bloc/weather/weather_cubit.dart';
import 'package:weather_app/featuers/weather/presentaion/bloc/weather/weather_states.dart';
import 'package:weather_app/featuers/weather/presentaion/widgets/text_padding.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _userState = getUserState();

  bool _isCityChangedInDrawer = false;

  void _getWeatherData(String? name) {
    BlocProvider.of<WeatherCubit>(context).getWeatherData(name: name);
  }

  void _getFiveDaysWeather(String? name) {
    BlocProvider.of<FiveDaysWeatherCubit>(context)
        .getFiveDaysWeatherData(name: name);
  }

  void _onCountryChange() {
    BlocProvider.of<OnboardingCubit>(context).chooseCountry();
  }

  void _onStateChange(String state) {
    BlocProvider.of<OnboardingCubit>(context).chooseState(state);
  }

  void _changeCity() async {
    //setState(() {});
    _isCityChangedInDrawer = true;
    _userState = getUserState();
    _getFiveDaysWeather(_userState);
    _getWeatherData(_userState);
    //ScaffoldMessenger.of(context).showSnackBar(
      //const SnackBar(
       // content: Text(AppStrings.cityChangeScuccecfully),
    //  ),

    //);
    Fluttertoast.showToast(msg: AppStrings.cityChangeScuccecfully,gravity: ToastGravity.BOTTOM,backgroundColor: Colors.green);
  }

  @override
  void initState() {
    _getWeatherData(_userState);
    _getFiveDaysWeather(_userState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: app_drawer.Drawer(
        onCountryChanged: (value) {
          _onCountryChange();
        },
        onStateChanged: (value) {
          _onStateChange(value ?? AppStrings.defaultCountry);
        },
        changeCity: () => _changeCity(),
      ),
      body: Container(
        color: Colors.lightBlue[200],
        child: CustomScrollView(
          slivers: [
            _buildWatherColumn(),
            _buildFiveDaysWeaherData(),
          ],
        ),
      ),
    );
  }

  Widget _buildWatherColumn() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          BlocConsumer<WeatherCubit, WeatherStates>(
            listener: (context, state) {
              if (state is ErrorWeatherState) {
                /*
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  duration: const Duration(seconds: 2),
                ));
                */
              }
            },
            builder: (context, state) {
              if (state is ErrorWeatherState) {
                return error_widget.ErrorWidget(
                  errorText: state.message,
                  onPress: () {
                    _getWeatherData(_userState);
                    _getFiveDaysWeather(_userState);
                  },
                );
              } else if (state is LoadedWeatherState) {
                return Column(
                  children: <Widget>[
                    TextPadding(
                      text: state.weather.name,
                      top: 70,
                      left: 15,
                      right: 15,
                      fontSize: 50,
                    ),
                    TextPadding(
                      text:
                          ("${state.weather.main.temp.floor().toString()} \u2103 "),
                      top: 5,
                      left: 15,
                      right: 15,
                      fontSize: 70,
                      fontWeight: FontWeight.w800,
                    ),
                    TextPadding(
                      text: (state.weather.weather[0].main),
                      top: 5,
                      left: 15,
                      right: 15,
                      fontSize: 30,
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CachedNetworkImage(
                        imageUrl: _iconGetter(state.weather.weather[0].icon),
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error_outline,
                          size: 50,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  _buildFiveDaysWeaherData() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          BlocConsumer<FiveDaysWeatherCubit, FiveDaysWeatherStates>(
              listener: (context, state) {
            if (state is ErrorFiveDaysWeatherState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 2),
              ));
            }
          }, builder: (context, state) {
            if (state is ErrorFiveDaysWeatherState) {
              log("$state");
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              return error_widget.ErrorWidget(
                errorText: state.message,
                onPress: () {
                  _getWeatherData(_userState);
                  _getFiveDaysWeather(_userState);
                },
              );
            } else if (state is LoadedFiveDaysWeatherState) {
              final newData = _filterFiveDaysWeather(state.weather);
              log(newData[1].dtTxt);
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                //scrollDirection: Axis.horizontal,
                itemCount: newData.length,
                separatorBuilder: (_, index) => Divider(
                  color: Colors.grey[800],
                ),
                itemBuilder: (_, index) {
                  return ListTile(
                    visualDensity: const VisualDensity(vertical: 4),
                    leading: Text(
                      DateFormat('EEEE').format(
                        DateTime.parse(newData[index].dtTxt),
                      ),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          '${newData[index].main.temp.floor().toString()} \u2103',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          newData[index].weather[0].main,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ],
      ),
    );
  }

  String _iconGetter(String iconCode) {
    return 'http://openweathermap.org/img/wn/$iconCode@2x.png';
  }

  List<WeatherList> _filterFiveDaysWeather(FiveDaysWeather fiveDaysWeather) {
    final List<WeatherList> newList = [];
    for (int i = 0; i < fiveDaysWeather.list.length; i++) {
      if (i == 0) {
        newList.add(fiveDaysWeather.list[0]);
      } else {
        if (i + 8 > fiveDaysWeather.list.length - 1) {
          break;
        }
        if (i % 7 != 0) {
          continue;
        }
        newList.add(fiveDaysWeather.list[i]);
      }
    }
    return newList;
  }
}
