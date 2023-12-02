import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weatherBloc/weather_event.dart';
import 'package:weather_app/bloc/weatherBloc/weather_state.dart';
import 'package:weather_app/utils/keys.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        List<Weather> weatherFl = await wf.fiveDayForecastByLocation(
            event.position.latitude, event.position.longitude);
        if (kDebugMode) {
          print('weather = $weather');
          log('weatherList = $weatherFl 656566');
        }
        emit(WeatherSuccess(weather));
      } catch (err) {
        emit(WeatherFailure());
      }
    });
  }
}
