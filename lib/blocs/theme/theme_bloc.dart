import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constants/constants.dart';
import '../weather/weather_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final WeatherBloc weatherBloc;
  late final StreamSubscription _weatherSubscription;
  ThemeBloc({
    required this.weatherBloc,
  }) : super(ThemeState.initial()) {
    _weatherSubscription = weatherBloc.stream.listen(
      (WeatherState weatherState) {
        if (weatherState.weather.temp > kWarmOrNot) {
          add(const SetThemeEvent(appTheme: AppTheme.light));
        } else {
          add(const SetThemeEvent(appTheme: AppTheme.dark));
        }
      },
    );
    on<SetThemeEvent>((event, emit) {
      emit(state.copyWith(appTheme: event.appTheme));
    });
  }

  @override
  Future<void> close() {
    _weatherSubscription.cancel();
    return super.close();
  }
}
