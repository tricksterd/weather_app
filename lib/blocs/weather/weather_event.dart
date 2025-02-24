part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FethcWeatherEvent extends WeatherEvent {
  final String city;
  const FethcWeatherEvent({
    required this.city,
  });

  @override
  String toString() => 'FethcWeatherEvent(city: $city)';
}
