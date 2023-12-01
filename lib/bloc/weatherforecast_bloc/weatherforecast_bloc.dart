import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weather_state.dart';

import '../../utils/keys.dart';

part 'weatherforecast_event.dart';
part 'weatherforecast_state.dart';

class WeatherForeCastBloc
    extends Bloc<WeatherForeCastEvent, WeatherForeCastState> {
  WeatherForeCastBloc() : super(WeatherForeCastInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherForeCastLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        List<Weather> weatherFl = await wf.fiveDayForecastByLocation(
            event.position.latitude, event.position.longitude);
        if (kDebugMode) {
          log('weatherList = $weatherFl');
        }
        emit(WeatherForeCastSuccess(weatherFl));
      } catch (err) {
        emit(WeatherForeCastFailure());
      }
      // TODO: implement event handler
    });
  }
}
