

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
/*class WeatherLoaded extends WeatherState {

  final List<Weather> hourlyWeather;

  const WeatherLoaded(this.hourlyWeather);

  @override
  List<Object> get props => [hourlyWeather];

}*/
class WeatherSuccess extends WeatherState {
  final Weather weather;
  const WeatherSuccess(this.weather);
  @override
  List<Object> get props => [weather];
}
class WeatherFailure extends WeatherState {}
