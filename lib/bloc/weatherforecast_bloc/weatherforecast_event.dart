part of 'weatherforecast_bloc.dart';

abstract class WeatherForeCastEvent extends Equatable {
  const WeatherForeCastEvent();
  @override
  List<Object> get props => [];
}

class FetchWeatherForeCast extends WeatherForeCastEvent{
  final Position position;
  const FetchWeatherForeCast(this.position);
}