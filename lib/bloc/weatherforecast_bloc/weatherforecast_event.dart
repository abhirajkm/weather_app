part of 'weatherforecast_bloc.dart';

abstract class WeatherForeCastEvent extends Equatable {
  const WeatherForeCastEvent();
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherForeCastEvent{
  final Position position;
  const FetchWeather(this.position);
}