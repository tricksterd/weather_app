import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<SetThemeEvent>((event, emit) {
      emit(state.copyWith(appTheme: event.appTheme));
    });
  }

  void setTheme(double courrentTemp) {
    if (courrentTemp > kWarmOrNot) {
      add(const SetThemeEvent(appTheme: AppTheme.light));
    } else {
      add(const SetThemeEvent(appTheme: AppTheme.dark));
    }
  }
}
