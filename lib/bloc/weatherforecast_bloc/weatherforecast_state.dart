part of 'weatherforecast_bloc.dart';
@immutable
abstract class WeatherForeCastState extends Equatable {
  const WeatherForeCastState();
  @override
  List<Object> get props => [];
}

class WeatherForeCastInitial extends WeatherForeCastState {}
class WeatherForeCastLoading extends WeatherForeCastState {}
class WeatherForeCastSuccess extends WeatherForeCastState {
  final List<Weather> hourlyWeather;

  const WeatherForeCastSuccess(this.hourlyWeather);

  @override
  List<Object> get props => [hourlyWeather];
}
class WeatherForeCastFailure extends WeatherForeCastState {}
