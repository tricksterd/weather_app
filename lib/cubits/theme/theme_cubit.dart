import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/cubits/weather/weather_cubit.dart';

import '../../constants/constants.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final WeatherCubit weatherCubit;
  late final StreamSubscription _weatherSubscription;

  ThemeCubit({
    required this.weatherCubit,
  }) : super(ThemeState.initial()) {
    _weatherSubscription =
        weatherCubit.stream.listen((WeatherState weatherState) {
      AppTheme newTheme = weatherState.weather.temp > kWarmOrNot
          ? AppTheme.light
          : AppTheme.dark;
      emit(state.copyWith(appTheme: newTheme));
    });
  }

  @override
  Future<void> close() {
    _weatherSubscription.cancel();
    return super.close();
  }
}
